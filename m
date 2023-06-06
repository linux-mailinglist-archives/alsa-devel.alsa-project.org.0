Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2172458B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 637F5826;
	Tue,  6 Jun 2023 16:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 637F5826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686061052;
	bh=rnDPzh6t/utRRLqdcTIkFyKsFszV8CQAcWAddmK/y1g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C68hrHibUPuuh08BsrH+A1nG++nC0QcUIOCNprfU5NlqVU/Mi/lydQ+vA2yvt2Uvl
	 G55pkwVgPm9hLq8HYYa69zrKh1kQidpW7z8+tFzFj3VmZ0Oblh6tbSIDC4POub6FEp
	 bbO1O857tkPW0x8aEnG5uM9i44gAjkCT8HJ+5mxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3877FF805AB; Tue,  6 Jun 2023 16:15:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D2D4F805A1;
	Tue,  6 Jun 2023 16:15:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21533F80254; Tue,  6 Jun 2023 15:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id B01A2F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B01A2F80155
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8AxGurXM39kWzAAAA--.382S3;
	Tue, 06 Jun 2023 21:25:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxfcrVM39kyHICAA--.1597S2;
	Tue, 06 Jun 2023 21:25:42 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 0/4] Add Loongson HD Audio support
Date: Tue,  6 Jun 2023 21:25:26 +0800
Message-Id: <cover.1686057365.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxfcrVM39kyHICAA--.1597S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JryDWF45ArWrZr13tr4UZFc_yoWfAwb_A3
	yIgFWkuFyDCasrAFyIvr4kCr9xXayUZ34UK3Zaqr1UXanxtrsxKr9rCrWfur1xXFn5Jr15
	Xryqgr4Fyr12vosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7tx6UUUUU
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A3K4OB427ZGZU23GEIFI5Z2C7AFNJKS5
X-Message-ID-Hash: A3K4OB427ZGZU23GEIFI5Z2C7AFNJKS5
X-Mailman-Approved-At: Tue, 06 Jun 2023 14:14:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3K4OB427ZGZU23GEIFI5Z2C7AFNJKS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

v2:
* Handling with two new flags added to struct hdac_bus.

v1:
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

 include/linux/pci_ids.h     |  3 +++
 include/sound/hdaudio.h     |  2 ++
 sound/hda/hdac_controller.c |  5 ++++-
 sound/hda/hdac_device.c     |  1 +
 sound/hda/hdac_stream.c     |  6 +++++-
 sound/pci/hda/hda_intel.c   | 15 +++++++++++++++
 sound/pci/hda/patch_hdmi.c  |  1 +
 7 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.31.4

