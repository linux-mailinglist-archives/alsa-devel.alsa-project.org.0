Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819394BBC3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 16:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D179169F;
	Wed, 19 Jun 2019 16:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D179169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560954979;
	bh=Ka+fTwof4nCwaiMJ6AlgSSPByB5l6LNio/2j4qM7bcQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZYIDbrc8z24VDN8pqiRYQRwMHOwNAWgNKZbLK5wEjd1yC23Gbj3LZBzZpfB0wKZ9v
	 iE7PNt/aRVovos0NL4qE1HrX28m0j7pke+ImAClvnty1Zumjux+vrCBe4LhwZ9lFmF
	 m0GnYJEsK/RUaVAqUwHEW5TIwlIJ0fgp0yE7q36w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 713ACF896DA;
	Wed, 19 Jun 2019 16:34:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B61BF896B8; Wed, 19 Jun 2019 16:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C642F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 16:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C642F808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="EYFdyfli"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JEY1DA043144;
 Wed, 19 Jun 2019 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=oYczuqmsavZDyQnx5ipOp1iY2U6P0wOD9kNRjBPn+uM=;
 b=EYFdyfli9mvW78RBwsd4+AAVDY1FNZafxpYEQc18H1Fiq1Hy99YFAEIiTjjUyat5xMcj
 x9h84+7jc5FlLuYgoNX/wZRaTDPrlosBkd01YPBFwXipTYDs0eBC99XeqwqspOInFd0r
 1WiiguWkzQA1m8Np19rWbAIR8QpNNnJrmxD38gciua+OIsE2qJCvLVY8OxTyuq/q3sq8
 So8/Pk09+VXgyY42IrD2rjnC575RQzLstmzT4k6cns8FQddE2+HxgBHs1i5eJkTTxKDA
 TY0D6L+w3ECWDvstcNimdAXymjSIhSKPOOjNHFCfZx25jN7AIPVWk7vybrJqgc3bdcbQ 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2t7809buy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 14:34:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JEXbPJ028660;
 Wed, 19 Jun 2019 14:34:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t77yn4tty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 14:34:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JEYJcZ017606;
 Wed, 19 Jun 2019 14:34:23 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 07:34:19 -0700
Date: Wed, 19 Jun 2019 17:34:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: codrin.ciubotariu@microchip.com
Message-ID: <20190619143414.GA26033@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=933
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=986 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190119
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ASoC: codecs: ad193x: Fix frame polarity
 for DSP_A format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Codrin,

Linus recently corrected me on one of my patches and I said I would
look through the kernel and fix similar bugs as well.  The problem I
realized is that I'm really stupid and I have forgot how to do math...

The patch 90f6e6803139: "ASoC: codecs: ad193x: Fix frame polarity for
DSP_A format" from Feb 18, 2019, leads to the following static
checker warning:

	sound/soc/codecs/ad193x.c:244 ad193x_set_dai_fmt()
	warn: passing casted pointer '&dac_fmt' to 'change_bit()' 32 vs 64.

sound/soc/codecs/ad193x.c
   194  static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
   195                  unsigned int fmt)
   196  {
   197          struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(codec_dai->component);
   198          unsigned int adc_serfmt = 0;
   199          unsigned int dac_serfmt = 0;
   200          unsigned int adc_fmt = 0;
   201          unsigned int dac_fmt = 0;
                ^^^^^^^^^^^^^^^^^^^^^^^^
This is a u32.

   202  
   203          /* At present, the driver only support AUX ADC mode(SND_SOC_DAIFMT_I2S
   204           * with TDM), ADC&DAC TDM mode(SND_SOC_DAIFMT_DSP_A) and DAC I2S mode
   205           * (SND_SOC_DAIFMT_I2S)
   206           */
   207          switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   208          case SND_SOC_DAIFMT_I2S:
   209                  adc_serfmt |= AD193X_ADC_SERFMT_TDM;
   210                  dac_serfmt |= AD193X_DAC_SERFMT_STEREO;
   211                  break;
   212          case SND_SOC_DAIFMT_DSP_A:
   213                  adc_serfmt |= AD193X_ADC_SERFMT_AUX;
   214                  dac_serfmt |= AD193X_DAC_SERFMT_TDM;
   215                  break;
   216          default:
   217                  if (ad193x_has_adc(ad193x))
   218                          return -EINVAL;
   219          }
   220  
   221          switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   222          case SND_SOC_DAIFMT_NB_NF: /* normal bit clock + frame */
   223                  break;
   224          case SND_SOC_DAIFMT_NB_IF: /* normal bclk + invert frm */
   225                  adc_fmt |= AD193X_ADC_LEFT_HIGH;
   226                  dac_fmt |= AD193X_DAC_LEFT_HIGH;
   227                  break;
   228          case SND_SOC_DAIFMT_IB_NF: /* invert bclk + normal frm */
   229                  adc_fmt |= AD193X_ADC_BCLK_INV;
   230                  dac_fmt |= AD193X_DAC_BCLK_INV;
   231                  break;
   232          case SND_SOC_DAIFMT_IB_IF: /* invert bclk + frm */
   233                  adc_fmt |= AD193X_ADC_LEFT_HIGH;
   234                  adc_fmt |= AD193X_ADC_BCLK_INV;
   235                  dac_fmt |= AD193X_DAC_LEFT_HIGH;
   236                  dac_fmt |= AD193X_DAC_BCLK_INV;
   237                  break;
   238          default:
   239                  return -EINVAL;
   240          }
   241  
   242          /* For DSP_*, LRCLK's polarity must be inverted */
   243          if (fmt & SND_SOC_DAIFMT_DSP_A) {
   244                  change_bit(ffs(AD193X_DAC_LEFT_HIGH) - 1,
   245                             (unsigned long *)&dac_fmt);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This change_bit() will work on little endian systems but on 64 bit big
endian systems it will corrupt memory.  I *think* the correct code looks
like this, but again, I'm feeling dumb so I might be wrong:

			dac_fmt ^= 1 << (ffs(AD193X_DAC_LEFT_HIGH) - 1);

   246          }
   247  

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
