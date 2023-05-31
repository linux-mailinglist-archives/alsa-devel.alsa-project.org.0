Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DEF71A3B8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D38A4B;
	Thu,  1 Jun 2023 18:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D38A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635586;
	bh=CsaLfza3J09ZOxxtaYRepSUAW/nbhp6GbA7oB2KLZbw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mpMtJ82xlQT+5I1ZbD8I/gWs5wJojXzB9QH0aim1TW+P22EQA6djo7lDPqAZ/RTBF
	 E9+/XOCvT3v29OWFTqYkPYL5W2Qt5BmBIR8PJnLnjWrJQnNZSMIccMtchKamasnEom
	 CphzrlnArFzjGvg4+KVEaFQkhfNeRfAMc1lg5HZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D877EF8047D; Thu,  1 Jun 2023 18:02:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AEFF805EF;
	Thu,  1 Jun 2023 18:02:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A93EFF8053D; Wed, 31 May 2023 05:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B027F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B027F800DF
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8AxyfFDvXZkyNMCAA--.6432S3;
	Wed, 31 May 2023 11:21:40 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77M_vXZkqrWBAA--.14943S2;
	Wed, 31 May 2023 11:21:37 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 0/4] Add Loongson HD Audio support
Date: Wed, 31 May 2023 11:21:30 +0800
Message-Id: <cover.1685501806.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77M_vXZkqrWBAA--.14943S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrurW8Jr48GF43ur1fGr1UGFg_yoW3KrX_A3
	yIvFWkurWUuasrAF92vr4kCryfXayUu3yUK3Z3tr48Zan3tr4aqryDCrWfur1xWFn5Jryr
	XrWqgF4rAr1aqjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	g7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8hmRUUUUUU==
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7UIFNXPY67KBFHYOAHMVUQX4HA5GVROT
X-Message-ID-Hash: 7UIFNXPY67KBFHYOAHMVUQX4HA5GVROT
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UIFNXPY67KBFHYOAHMVUQX4HA5GVROT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* The Loongson HDA controller is compatible with High Definition Audio
  Specification Revision 1.0a.
  See <https://loongson.github.io/LoongArch-Documentation/Loongson-
  7A1000-usermanual-EN.html#hda-controller>

Yanteng Si (4):
  ALSA: hda: Add Loongson LS7A HD-Audio support
  ALSA: hda: Using polling mode for loongson controller by default
  ALSA: hda: Workaround for SDnCTL register on loongson controller
  ALSA: hda/intel: Workaround for WALLCLK register for loongson
    controller

 include/linux/pci_ids.h        |  3 +++
 sound/hda/hdac_controller.c    |  8 +++++++-
 sound/hda/hdac_device.c        |  1 +
 sound/hda/hdac_stream.c        |  8 +++++++-
 sound/pci/hda/hda_controller.h |  1 +
 sound/pci/hda/hda_intel.c      | 10 ++++++++++
 sound/pci/hda/patch_hdmi.c     |  1 +
 7 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.31.4

