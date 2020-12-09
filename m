Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A0F2D3BBA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 07:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D7A16DF;
	Wed,  9 Dec 2020 07:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D7A16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607496970;
	bh=6hFDllIzdbOlM1juRiS4qM8qXIyIorBMa+dSvJJgaC4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y38mlU8hgCkYYMWwChzDeG7HxjhWMwsKtU76nKXTPJRmvu7vms15/FTrHkeCbWbmu
	 kYX+HVFjTZDsBon47Lx2sWp0u9jk//+UxHvy8bfiqJRSoKErmJynljS8pe7kHZk0Wh
	 ZTxCRfulUF8rj6Z6qhiPRj4rCAJoSLYyOKLpLSQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA63F801D8;
	Wed,  9 Dec 2020 07:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFEE5F8020D; Wed,  9 Dec 2020 07:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA9C7F8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 07:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9C7F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="nQb2KTk9"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96rvPj060038;
 Wed, 9 Dec 2020 06:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=py50jVKEV/8HTbxBYMr3xZIe+GME98V7Xxgt1csFjuE=;
 b=nQb2KTk9icTNDQeXjsf/QrElWlqBDfYZiYDf7HyO0CLV+NDImQqsIhaq0BF1HmsaLWx0
 pf8/AEXPvY/PPkqe1/YzamAunzlGT569L2ByacVXZJZW0T4uinTBWmRlTRzcs60EzngG
 5310w6lahsImAatvFxpEBRnIpdKVdlLAUi7JWLAwBdz2h34vgZyIaYsQUZmR8JVSgrxk
 rxOaK9WFijt63+23N3PGXbiEinLWM575psnIbgBT8xPwFGnx2BmSmmCBlRxK8LgibFx7
 y4MYjlBmlF8dO7Jh+FFJ3B/YqEq7oGMLpl3bv+b4MRnMIQg3n3oxH6pK8VtjMZyP67Hg lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mqxfq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 06:53:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oabv138765;
 Wed, 9 Dec 2020 06:53:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 358m3ytpvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 06:53:57 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B96rpxc024323;
 Wed, 9 Dec 2020 06:53:56 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 22:53:50 -0800
Date: Wed, 9 Dec 2020 09:53:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [bug report] ASoC: topology: fix endianness issues
Message-ID: <X9B0eDcKy+9B6kZl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=3 mlxscore=0 mlxlogscore=825
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 mlxlogscore=822
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090047
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

[ This bug is way older than your patch but you might know the answer.
  -dan ]

Hello Pierre-Louis Bossart,

The patch 5aebe7c7f9c2: "ASoC: topology: fix endianness issues" from
Apr 4, 2019, leads to the following static checker warning:

	sound/soc/soc-topology.c:903 soc_tplg_denum_create_values()
	warn: potential pointer math issue ('se->dobj.control.dvalues' is a 64 bit pointer)

sound/soc/soc-topology.c
   887  static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
   888                                          struct snd_soc_tplg_enum_control *ec)
   889  {
   890          int i;
   891  
   892          if (le32_to_cpu(ec->items) > sizeof(*ec->values))

The warning is from this line where Smatch starts to think that
"ec->items" is the number of bytes, but later in the function we treat
it was the number of elements.

I do think probably this should be if:

		if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->values))
			return -EINVAL;

The ec->values[] is an array of u32:

	__le32 values[SND_SOC_TPLG_NUM_TEXTS * SNDRV_CTL_ELEM_ID_NAME_MAXLEN / 4];

so this code will return -EINVAL for anything larger than 4.  Changing
it to ARRAY_SIZE() would raise the limit to 176.

   893                  return -EINVAL;
   894  
   895          se->dobj.control.dvalues = devm_kzalloc(tplg->dev, le32_to_cpu(ec->items) *
   896                                             sizeof(u32),
   897                                             GFP_KERNEL);
   898          if (!se->dobj.control.dvalues)
   899                  return -ENOMEM;
   900  
   901          /* convert from little-endian */
   902          for (i = 0; i < le32_to_cpu(ec->items); i++) {
   903                  se->dobj.control.dvalues[i] = le32_to_cpu(ec->values[i]);
   904          }
   905  
   906          return 0;
   907  }

regards,
dan carpenter
