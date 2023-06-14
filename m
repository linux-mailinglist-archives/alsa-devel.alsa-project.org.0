Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749767311D9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 10:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A23631EF;
	Thu, 15 Jun 2023 10:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A23631EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686816787;
	bh=cc79EEoCZjbPOtj6KApZDj8CibRMonEEDd5xuwGeXZ0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bhy41OxMDjHJNcr5n7+lceX01gEdNJ+PNqfPOnmRADSOOEiBk4VdzpKv0qb6Y4xgH
	 0lojW+p/JHs1P00fwIDa151MSQnapyQ9Ikm2thPgpCWZ2wIF5tT8ngJGLeCMvIBHbc
	 wMnr7S42Qdl19uDlHINFOc9aih3B2x2kIMNQrTO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC455F80301; Thu, 15 Jun 2023 10:12:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD29F80130;
	Thu, 15 Jun 2023 10:12:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA343F80149; Wed, 14 Jun 2023 14:19:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 374B2F80130
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 14:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374B2F80130
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8DxAOlbsIlk1R8FAA--.9121S3;
	Wed, 14 Jun 2023 20:19:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPMpasIlkRJgaAA--.1367S4;
	Wed, 14 Jun 2023 20:19:38 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	krzysztof.kozlowski@linaro.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	mengyingkun@loongson.cn
Subject: [PATCH v3 0/3] Add Loongson I2S controller support
Date: Wed, 14 Jun 2023 20:18:37 +0800
Message-Id: <20230614121837.3402734-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPMpasIlkRJgaAA--.1367S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQACDGSIXIIYSwAIsm
X-Coremail-Antispam: 1Uk129KBj93XoWxuF48Jw4fWr43urWUGrWDZFc_yoW5Xw17pa
	nxC393Wr45tr1ayFn3AFy8GFWrAryrCrsxGa17Xw1UGr9Fy3W8u343tF1UZFW3Ary8Jryq
	9ryrGrW8G3ZxG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4TXZWVJBZ2GBET2UZJ4Z5AISKNM3TSBS
X-Message-ID-Hash: 4TXZWVJBZ2GBET2UZJ4Z5AISKNM3TSBS
X-Mailman-Approved-At: Thu, 15 Jun 2023 08:12:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TXZWVJBZ2GBET2UZJ4Z5AISKNM3TSBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

This patchset adds support for Loongson I2S controller, and
introduce a ASoC machine driver for loongson platform.

The Loongson I2S controller is available on Loongson
7a2000/2k2000 chips, works as a PCI device. It has two
private DMA controllers used to playback and capture.
Each DMA controller has one channel.

The ASoC machine driver adds support for audio device which
using loongson I2S controller to tranfser the audio data.
The audio device uses "PRP0001" as its ACPI device ID, which
provides a means to use the existing DT-compatible device
identification in ACPI.


Thanks.

---
Changes v2 -> v3
  - Patch 1
    Split the driver into PCI driver and component driver.
    Move interrupt requesting from pcm_open to pcm_create.
    Use pcim_xxx() API to get iomap of I2S register.
    Add condition checking for the number of periods.
    Add set_fmt() callback for DAI ops.
    Add volatile registers for regmap of I2S.
    Remove redundant condition checking.
    Update comment style.

  - Patch 2
    Remove redundant SoC DAI link.
    Update comment style.

  - Patch 3
    No change.


Changes v1 -> v2
  - Patch 1
    Replace pci_xxx() APIs with pcim_xxx() APIs.
    Fix build errors from lkp@intel.com.
    Minor changes in log printing.

  - Patch 2
    Use ACPI bindings to reference I2S and codec nodes.
    
  - Patch 3
    Add chip model restriction for title and description.
    Add 'required' option for sound-dai property.

Yingkun Meng (3):
  ASoC: Add support for Loongson I2S controller
  ASoC: loongson: Add Loongson ASoC Sound Card Support
  ASoC: dt-bindings: Add support for Loongson audio card

 .../sound/loongson,ls-audio-card.yaml         |  70 ++++
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/loongson/Kconfig                    |  26 ++
 sound/soc/loongson/Makefile                   |   8 +
 sound/soc/loongson/loongson_card.c            | 230 ++++++++++++
 sound/soc/loongson/loongson_dma.c             | 350 ++++++++++++++++++
 sound/soc/loongson/loongson_dma.h             |  16 +
 sound/soc/loongson/loongson_i2s.c             | 269 ++++++++++++++
 sound/soc/loongson/loongson_i2s.h             |  71 ++++
 sound/soc/loongson/loongson_i2s_pci.c         | 171 +++++++++
 11 files changed, 1213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
 create mode 100644 sound/soc/loongson/Kconfig
 create mode 100644 sound/soc/loongson/Makefile
 create mode 100644 sound/soc/loongson/loongson_card.c
 create mode 100644 sound/soc/loongson/loongson_dma.c
 create mode 100644 sound/soc/loongson/loongson_dma.h
 create mode 100644 sound/soc/loongson/loongson_i2s.c
 create mode 100644 sound/soc/loongson/loongson_i2s.h
 create mode 100644 sound/soc/loongson/loongson_i2s_pci.c


base-commit: a11e6515b019da62266b731ff20bc6863f00df4d
-- 
2.33.0

