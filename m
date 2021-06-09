Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD13A12D1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 13:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED6016BD;
	Wed,  9 Jun 2021 13:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED6016BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623238449;
	bh=wpE+D9/qpr9ZeG3E897BhDch9Gn3jLFJRH+RxEctbYQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=leMY3NXc4Kr4U0eBhzhBbPEsoWbS3OeILb3Jaakmbcm3RpauVosAYaQ8DA79vOPiq
	 gHazSwyBW6XoWWJ0on3pqXg/aqipCyHNCPBWR3dss3dlYvhVTayWG8NebPZsqSPvxS
	 baW41CbDKn9mWL2mGfYxyO/OyZU0H4IhIoR8DvUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D7BF80276;
	Wed,  9 Jun 2021 13:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595AFF8026C; Wed,  9 Jun 2021 13:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC7C7F8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 13:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC7C7F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="oY3Om2kJ"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159BQ7mk123170;
 Wed, 9 Jun 2021 11:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=kTWqT2o/HN7pdyhcerzSs3sAT1yLTpEn8l854pTm+Qk=;
 b=oY3Om2kJ9H7rgrvqUjy9iNvLEnJHE+Oj2x/1hWWb8+/6cYhCz3csrJ1rGNynYDiztfQv
 QKEy1kWedFjrBJYX7avavjQwMCOXS/fDYNiVmZy1GJEBW9XAjplMM+/B0t8OU7eNqN39
 w0N75vMhOZOa2Gl6Gfk2FXBJ/81ytV9mUy7hTuCn+DqunRx/L5KzqtLew7l1x9cJX+u5
 pOkv0gt7LzYgLE0y+TJ/PvmrvMYirsUS/WiGKJAAZvF5lZJAqB3J3mYI0GzdX8fPO5AO
 1aSOV1zPtlcLBOeYG8bgTqVLaRfZ10+quxXzrIfMW+qLMHkWCMwSN9TRs01BCWtoXR8n jA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3900ps8uhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 11:32:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 159BQsq8165319;
 Wed, 9 Jun 2021 11:32:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3922wuqmj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 11:32:28 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 159BW803041213;
 Wed, 9 Jun 2021 11:32:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 3922wuqgjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jun 2021 11:32:08 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 159BVN4i004539;
 Wed, 9 Jun 2021 11:31:27 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Jun 2021 04:31:23 -0700
Date: Wed, 9 Jun 2021 14:31:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kuninori.morimoto.gx@renesas.com
Subject: [bug report] ASoC: rsnd: add null CLOCKIN support
Message-ID: <YMCmhfQUimHCSH/n@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: oAiJenV3TL_aHHhLFql5TQIZ3Xh_Yq5n
X-Proofpoint-ORIG-GUID: oAiJenV3TL_aHHhLFql5TQIZ3Xh_Yq5n
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10009
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=971
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090056
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

Hello Kuninori Morimoto,

The patch d6956a7dde6f: "ASoC: rsnd: add null CLOCKIN support" from
May 24, 2021, leads to the following static checker warning:

	sound/soc/sh/rcar/adg.c:435 rsnd_adg_get_clkin()
	warn: 'clk' isn't an ERR_PTR

sound/soc/sh/rcar/adg.c
   423  static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
   424  {
   425          struct rsnd_adg *adg = priv->adg;
   426          struct device *dev = rsnd_priv_to_dev(priv);
   427          struct clk *clk;
   428          int i;
   429  
   430          for (i = 0; i < CLKMAX; i++) {
   431                  clk = devm_clk_get(dev, clk_name[i]);

If devm_clk_get() returns NULL that's not an error.


   432  
   433                  if (IS_ERR(clk))
   434                          clk = rsnd_adg_null_clk_get(priv);

But I think if rsnd_adg_null_clk_get() returns an error then it is an
error.


   435                  if (IS_ERR(clk))

This is impossible.

   436                          goto err;

So I think it should be:

			if (IS_ERR(clk)) {
				clk = rsnd_adg_null_clk_get(priv);
				if (!clk)
					goto err;
			}

   437  
   438                  adg->clk[i] = clk;
   439          }
   440  
   441          return 0;
   442  
   443  err:
   444          dev_err(dev, "adg clock IN get failed\n");
   445  
   446          rsnd_adg_null_clk_clean(priv);
   447  
   448          return -EIO;
   449  }

regards,
dan carpenter
