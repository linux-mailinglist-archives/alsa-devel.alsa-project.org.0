Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE854C845
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42EE718F4;
	Wed, 15 Jun 2022 14:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42EE718F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655295385;
	bh=jv8G1agcRVwhrz1O1q4Ch+Z472ENfIeo/WXmazNLAX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uU2sU4rpFXVVUE6UliH4EV2XXvxlJYs9zVLTOC4LV/4RTsPFSozAbYBALHrzLpLe0
	 oWeQknR5CxkKi+XOPYtKF4KEwp8+gKdFYFQGIBboGvmr8WRHMsQ4dDm87dEmW7khTz
	 TwDCDVwt1vkS1WXGFZpDUQooz2PaWJSwoWR6UnjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A027DF8028D;
	Wed, 15 Jun 2022 14:15:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D994F801F7; Wed, 15 Jun 2022 14:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE026F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 14:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE026F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UC72yPVi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EdSmfthi"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A20A13200A07;
 Wed, 15 Jun 2022 08:15:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Jun 2022 08:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655295313; x=
 1655381713; bh=U41sdkndxEPcUW2HyhBS60wraWtLaKd+4y+3d1M8lDk=; b=U
 C72yPViI75uIyif27I908MvytUcWLKm4N0ESE9OMSEsPDU5mEMXIDA1NGBEAx7AB
 KzgNZFWcrEf7RY6Oq2w3+rcms7VrK/0j6zo3OqehN0dKV42dVZ7eHo007OygHNHm
 e5z4rRgbEpnFRn1ZuTXyv8RCDKpS61q9wyTNC08LfT0Y1qYOKOVRkF8CyQjRq0rs
 ORp1YBIy8lCtw6ustyPzQ2wLXkCdMFe4IfUYrT4x2lE3bIL4ci4NtFdjjhLrQlpB
 kdaOMS2xYnIM0e6r9JYCXP49gHGAPDPz3cxaXeCsXjRFMbbVps1qp3kufzr4FBZf
 EMV0bqn1Otq4WqKmHND+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655295313; x=1655381713; bh=U41sdkndxEPcU
 W2HyhBS60wraWtLaKd+4y+3d1M8lDk=; b=EdSmfthiQpm5UGVfTfzka8hJNiyjz
 OmHGJdMdfl6LLSbZ6CbyGECyy2x2LWpi94UvhdIdozNksOAkvXF9SSgwZIVkVtKd
 wkTtsIneHKuzVJb9+R2WD0RsaejsaNtjlNGvpoDd8T/s6Kbgse1iJMBcktZ4+3DJ
 bBLY3ehCoyn2Lv9Gq5b/N9FF8LNsItVm/BDrRW4FTwsSoB2AKUX/nbFC+Y4k6OhK
 L4mUPMP5oiu8yVcOMDFNIQP4y2kVkObn56eSG3xFrfSo68MUGrm7bLK4G+og6rXe
 +9ZfRCXIKUvocXxuB9tIw5zwWsYyU+Pc2WsredsWhpKYrfJoWhcPVW//A==
X-ME-Sender: <xms:UM2pYnse1Pd1FlW_rEXDZI_Dn60j10SaiK7LbUxbdQkfpcSxXFU_5g>
 <xme:UM2pYoeYDSQhn1E4ZTbwEf06tinRgDFVngwYoopNsHh8Tio9lXAMA-jEQbcj6XX4S
 j1fdTr5PeVulcjvitM>
X-ME-Received: <xmr:UM2pYqyTpza5M0Rh0hTjbJKcKC39Db0RN_UEKASEGnu_hHHriCviteMfhPWL6erF-DFNePJbnxohJlwxdKefc2e_CeZ3T6EDbRTt0tK-2sh3AlLxV7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepvdejgfejuedvgfduudekleevtefgtdevhfdtffef
 iefgveeuteffiedvffekvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:UM2pYmPUeWNeKNX3MBQt7NCQGs7lmvjR7azUd52zfhayCAFO_8riUg>
 <xmx:UM2pYn8kOLG5EGqm-rILAc_1C1iViz-ubMsT4B0O9bXTnMetCWDYVQ>
 <xmx:UM2pYmVArC0xF4gWa6oSA60oLyu-OljWUm1WF00sv6d-5M0Zicm0RA>
 <xmx:Uc2pYjZzsWNuTNc-prYpZVakq5OQfntXi3miPjQRr1DZJvS8dTRr8A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 08:15:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 1/3] firewire: convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Wed, 15 Jun 2022 21:15:03 +0900
Message-Id: <20220615121505.61412-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
References: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Abaci Robot <abaci@linux.alibaba.com>
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

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following coccicheck warning:

./drivers/firewire/core-device.c:375:8-16: WARNING: use scnprintf or
sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-device.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index 90ed8fdaba75..adddd8c45d0c 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -372,8 +372,7 @@ static ssize_t rom_index_show(struct device *dev,
 	struct fw_device *device = fw_device(dev->parent);
 	struct fw_unit *unit = fw_unit(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			(int)(unit->directory - device->config_rom));
+	return sysfs_emit(buf, "%td\n", unit->directory - device->config_rom);
 }
 
 static struct device_attribute fw_unit_attributes[] = {
@@ -403,8 +402,7 @@ static ssize_t guid_show(struct device *dev,
 	int ret;
 
 	down_read(&fw_device_rwsem);
-	ret = snprintf(buf, PAGE_SIZE, "0x%08x%08x\n",
-		       device->config_rom[3], device->config_rom[4]);
+	ret = sysfs_emit(buf, "0x%08x%08x\n", device->config_rom[3], device->config_rom[4]);
 	up_read(&fw_device_rwsem);
 
 	return ret;
-- 
2.34.1

