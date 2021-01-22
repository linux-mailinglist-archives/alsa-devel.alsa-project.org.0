Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6022FFE4A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0C181ACB;
	Fri, 22 Jan 2021 09:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0C181ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611304627;
	bh=PNzcTGADnp0oTdjwlBvm5m61RZrhd4sae/zVPIq4WKo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h0AkZTpMKOidrjFDTZct2d4mgEGayL45L3hjcGvKoDbYIWOYlmiOHpVXN4RIBrI+x
	 +8m04qz3qJ45wVEnpPhly31kAl/wW/m1SXIfn6u9aEYyATTK5vqT4SqG5TmM4QWVg2
	 Be65ja+xF9IlDvkQz7apNNcQGs6IexCKdMTykB2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1941AF8019B;
	Fri, 22 Jan 2021 09:35:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D64DF8016E; Fri, 22 Jan 2021 09:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F59F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F59F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="m82pTmuD"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M8YKIE059791;
 Fri, 22 Jan 2021 08:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=PmBb1Q0+NgZrcuc8aVpdxKr00bMf6Izl6fW2YnedTfQ=;
 b=m82pTmuD3T7+RPO0CPq9RgbG03Nw6ONDN0NYB6rvV5HXaFPSvE2c4E1F5OSvslQdK/7U
 uinKjjOdLI1IHcwZ/Ypy64PYKy/XRI2S6yvlxEzHmeEr8+Djg9YYQIIRbQmRoZpyAbvS
 flXypT8YhvebZKkHAqZGCzCvKqe6cJJ0WICKdBkUikNTm34e/h38bhhiC5r63U0fty0v
 upa0SWSdonjr5X18Dwjzhh27xmM3eH0CqQsMSJy3CsQfyet8xtEie3elts8B0heIAShE
 Y7BaVs3D/1vGDwGjCVpVwnFd6kSEZJ3wb8/NworbaLtgiqHugF3z/OcAWsHBGco2X5U4 0g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 3668qn2w1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 08:35:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M8YmKP005708;
 Fri, 22 Jan 2021 08:35:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 3668qyf34f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 08:35:22 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10M8ZKKA010588;
 Fri, 22 Jan 2021 08:35:21 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 22 Jan 2021 00:35:20 -0800
Date: Fri, 22 Jan 2021 11:35:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: sre@kernel.org
Subject: [bug report] ASoC: cpcap: new codec
Message-ID: <YAqOSg2z24NpjKDh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=904 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=837 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220045
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Sebastian Reichel,

The patch f6cdf2d3445d: "ASoC: cpcap: new codec" from Feb 23, 2018,
leads to the following static checker warning:

	sound/soc/codecs/cpcap.c:1276 cpcap_voice_hw_params()
	warn: 'CPCAP_BIT_MIC1_RX_TIMESLOT0' is a shifter (not for '|=').

	sound/soc/codecs/cpcap.c:1279 cpcap_voice_hw_params()
	warn: 'CPCAP_BIT_MIC2_TIMESLOT0' is a shifter (not for '|=').

sound/soc/codecs/cpcap.c
  1253  static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
  1254                                   struct snd_pcm_hw_params *params,
  1255                                   struct snd_soc_dai *dai)
  1256  {
  1257          struct snd_soc_component *component = dai->component;
  1258          struct device *dev = component->dev;
  1259          struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
  1260          static const u16 reg_cdi = CPCAP_REG_CDI;
  1261          int rate = params_rate(params);
  1262          int channels = params_channels(params);
  1263          int direction = substream->stream;
  1264          u16 val, mask;
  1265          int err;
  1266  
  1267          dev_dbg(dev, "Voice setup HW params: rate=%d, direction=%d, chan=%d",
  1268                  rate, direction, channels);
  1269  
  1270          err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, rate);
  1271          if (err)
  1272                  return err;
  1273  
  1274          if (direction == SNDRV_PCM_STREAM_CAPTURE) {
  1275                  mask = 0x0000;
  1276                  mask |= CPCAP_BIT_MIC1_RX_TIMESLOT0;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
This should probably be BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0).


  1277                  mask |= CPCAP_BIT_MIC1_RX_TIMESLOT1;
  1278                  mask |= CPCAP_BIT_MIC1_RX_TIMESLOT2;
  1279                  mask |= CPCAP_BIT_MIC2_TIMESLOT0;
                                ^^^^^^^^^^^^^^^^^^^^^^^^

Same for all the others as well I guess.

  1280                  mask |= CPCAP_BIT_MIC2_TIMESLOT1;
  1281                  mask |= CPCAP_BIT_MIC2_TIMESLOT2;
  1282                  val = 0x0000;
  1283                  if (channels >= 2)
  1284                          val = BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0);
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here it's BIT(CPCAP_BIT_MIC1_RX_TIMESLOT0).

  1285                  err = regmap_update_bits(cpcap->regmap, reg_cdi, mask, val);
  1286                  if (err)
  1287                          return err;
  1288          }
  1289  
  1290          return 0;
  1291  }

regards,
dan carpenter
