Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E532E94E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 01:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE1E1662;
	Thu, 30 May 2019 01:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE1E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559172395;
	bh=LawEVlS6hUi+qcrs0RJ7Q1UHec1romm6DiqvWgbF/sc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uA/SX0/5iP+X07MSaEKJma9uiqPzqieABj4zfk9uCBOby3UUccSGcRW7fByc8s7AK
	 v5XYFeCWdfvgpsfvhvOuV1hLBRYRaT5xA4+twHitqDsEVJojYBe4GBMArxw4vkU3Zg
	 AVkcS+qi4mNsMo85fQ05nfRzxv60t24wNdpRH2j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE250F8972A;
	Thu, 30 May 2019 01:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 901CBF896E5; Thu, 30 May 2019 01:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 692B9F806E5
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 01:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 692B9F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="r5i5VQ2c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BkcoBEULBcLylfJQMb1h3qgxJnYCmoC/K1f+BmwyR9I=; b=r5i5VQ2cBMCv2EpcPr3ofx6HpS
 irJQbeS1vjKNMguKpEIJQQLvLu9RqSxXiDl6mgMN26pJnXpvlwNAUfcLSnEP8ldsDBd5C1T80uP4U
 yOfJzr1iIX3FneURlgBQunwcTr+kqrilagWsEBpwfbsHPlYPQ2JFAk8zqFuDGXpVpJTD8LTCqXs4m
 fi5MaEM0Q/g2RSfQW4eUKPYP/eIAOjYHYYRwzC2DZFcuT53LI5rORE79gj/B/XPmhOYUR4J1uLtJo
 o9NfLbaFCQfUb0KIqRnL2/fDO/hdIssAFpzvbdxjAW+5XXPsYVRsSAV9gUZJrpHdzAJqbQ0aHjqDR
 PhXzsWFg==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Rj-9C; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007x2-K4; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 29 May 2019 20:23:36 -0300
Message-Id: <36c1c04d050fa3f4f56efd306e59f5eeeccf4015.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jonathan Corbet <corbet@lwn.net>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Otto Sabart <ottosabart@seberm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Subject: [alsa-devel] [PATCH 05/22] mfd: madera: Fix bad reference to
	pinctrl.txt file
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

From: Otto Sabart <ottosabart@seberm.com>

The pinctrl.txt file was converted into reStructuredText and moved into
driver-api folder. This patch updates the broken reference.

Fixes: 5a9b73832e9e ("pinctrl.txt: move it to the driver-api book")
Signed-off-by: Otto Sabart <ottosabart@seberm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/mfd/madera/pdata.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pdata.h
index 8dc852402dbb..dd00ab824e5b 100644
--- a/include/linux/mfd/madera/pdata.h
+++ b/include/linux/mfd/madera/pdata.h
@@ -34,7 +34,8 @@ struct madera_codec_pdata;
  * @micvdd:	    Substruct of pdata for the MICVDD regulator
  * @irq_flags:	    Mode for primary IRQ (defaults to active low)
  * @gpio_base:	    Base GPIO number
- * @gpio_configs:   Array of GPIO configurations (See Documentation/pinctrl.txt)
+ * @gpio_configs:   Array of GPIO configurations (See
+ *		    Documentation/driver-api/pinctl.rst)
  * @n_gpio_configs: Number of entries in gpio_configs
  * @gpsw:	    General purpose switch mode setting. Depends on the external
  *		    hardware connected to the switch. (See the SW1_MODE field
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
