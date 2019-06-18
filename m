Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9549EF0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 13:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CAD616F0;
	Tue, 18 Jun 2019 13:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CAD616F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560856158;
	bh=f18p/eqWKmMBjACRXvBuD2Wuup+NI0r3ggvdZVQU9Uo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKHB2LPr5AunFql81MuSqRlnHzRfa+toOLTPjLj/WxxMP2ZgaF9ua4zf6tiAfKe8N
	 ZZ/9z68d8CvahCkIDaHJxnD1ku+id0c7rZPyU/50R0bfkB2nNpZUf2IaQ8XWBsGmYI
	 Ayo11lqt+VNOfd5kPb9jNXAj7HhGnD1gtVtiDimQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5EFF8971C;
	Tue, 18 Jun 2019 13:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF829F896F4; Tue, 18 Jun 2019 13:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 335A0F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 13:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 335A0F89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zboReyVs"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IB3w34122364;
 Tue, 18 Jun 2019 11:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=IoD4/XQHsuij4Xw/gJOg1ziHI/IMnOA0M8uPWaIeDu0=;
 b=zboReyVs5SHrwicclXStz0IKv5xabIsyrR0auE8AzraSDGYUA3VcT9HbMV37Eq6HoZ96
 FYrMwR2r5JblQSselGabi2/OiGsVcFYaysoNsJ4vRcFBlV/4KU69JIiynIDMOjtzkhDT
 w8rY2gtBgh1qgEQo3w+gnDLBDikL5kGkWhu5+uHKkTiX3rn6d3WTfv+EQ2VMdv+lR6cN
 GWrS7QbCLMYsu5kbTm2b6n/oOoeJamQeSjcXrQvgCfyBtG0Jx/G0PdKlS6rOUse9Csk4
 GzsbAuseViK0TBKoASS4vFYCdXpyIRWxpVfxNhKo+C6n7riHMLhHfrjBhZ09i9g8UIUB Ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t4r3tktx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 11:07:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IB7B3I170375;
 Tue, 18 Jun 2019 11:07:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t5cpdyy4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 11:07:19 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5IB7HaM018186;
 Tue, 18 Jun 2019 11:07:18 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 04:07:16 -0700
Date: Tue, 18 Jun 2019 14:07:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jbrunet@baylibre.com
Message-ID: <20190618110710.GA14934@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=894
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=936 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180092
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ASoC: meson: axg-card: fix null pointer
 dereference in clean up
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

Hello Jerome Brunet,

The patch 960f428ca0a0: "ASoC: meson: axg-card: fix null pointer
dereference in clean up" from Jun 10, 2019, leads to the following
static checker warning:

	sound/soc/meson/axg-card.c:121 axg_card_clean_references()
	warn: address of 'link->codecs[j]' is non-NULL

sound/soc/meson/axg-card.c
   109  static void axg_card_clean_references(struct axg_card *priv)
   110  {
   111          struct snd_soc_card *card = &priv->card;
   112          struct snd_soc_dai_link *link;
   113          struct snd_soc_dai_link_component *codec;
   114          int i, j;
   115  
   116          if (card->dai_link) {
   117                  for_each_card_prelinks(card, i, link) {
   118                          if (link->cpus)
   119                                  of_node_put(link->cpus->of_node);
   120                          for_each_link_codecs(link, j, codec)
   121                                  if (codec)
                                            ^^^^^
"codec" is the list iterator so it can't possibly be NULL.

   122                                          of_node_put(codec->of_node);
   123                  }
   124          }
   125  
   126          if (card->aux_dev) {
   127                  for (i = 0; i < card->num_aux_devs; i++)
   128                          of_node_put(card->aux_dev[i].codec_of_node);
   129          }
   130  
   131          kfree(card->dai_link);
   132          kfree(priv->link_data);
   133  }

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
