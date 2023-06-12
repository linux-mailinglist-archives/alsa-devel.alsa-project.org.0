Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71D72CA35
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA6B83B;
	Mon, 12 Jun 2023 17:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA6B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686584007;
	bh=JvIFM7O4H0lF+ksxpzCLpBiLELyf+8ihLvIrguVvSKk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Bj4znKdD4I/vB78quFFpHo56I3evr9218Z26UrOF5gKNk5+VHTTzVdMPzALecshAl
	 ka+ParmiZ2xDpE6JD3L6B0toXvOt0TCfeqLaRBWlXYfwbiXxCZhqjR/qgbD9M79T/U
	 4snVNYmKpLldSvjNPhtFOXl0GMnWsLUv66mSBz/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868DDF805A8; Mon, 12 Jun 2023 17:31:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE5EF80301;
	Mon, 12 Jun 2023 17:31:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86D0BF80132; Mon, 12 Jun 2023 10:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id C2459F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2459F800BA
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8AxHuuk3IZkVZgDAA--.7859S3;
	Mon, 12 Jun 2023 16:51:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXMqj3IZkl2cVAA--.53102S4;
	Mon, 12 Jun 2023 16:51:47 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	YingKun Meng <mengyingkun@loongson.cn>
Subject: [ PATCH v2 0/3] Add Loongson I2S controller support
Date: Mon, 12 Jun 2023 16:50:48 +0800
Message-Id: <20230612085048.3039471-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMqj3IZkl2cVAA--.53102S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAADGSFuYEEQQAGsX
X-Coremail-Antispam: 1Uk129KBj93XoWxJr4fXF1UKr1ftw1fCr17Arc_yoW8Zw4xpa
	nxC393WFW5tF4ayFn3tFy8JrWrAryrCFsxJanrX34UGr9Fv3WUu343tF15ZFW3CryUKFyq
	9ry8G3y8G3ZxG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X6AWYAHIQDPNQ7XEDKIS4APDEKFQEBUF
X-Message-ID-Hash: X6AWYAHIQDPNQ7XEDKIS4APDEKFQEBUF
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:31:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6AWYAHIQDPNQ7XEDKIS4APDEKFQEBUF/>
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
v2:
* Use ACPI bindings to reference I2S and codec nodes.
* Add 'required' restriction for sound-dai property in
  dt-bindings.
* Fix build errors from lkp@intel.com.
* Replace pci_xxx() APIs with pcim_xxx() APIs.
* mirror changes in log printing.

v1:
* Add support for Loongson I2S controller.

Yingkun Meng (3):
  ASoC: Add support for Loongson I2S controller
  ASoC: loongson: Add Loongson ASoC Sound Card Support
  ASoC: dt-bindings: Add support for Loongson audio card

 .../sound/loongson,ls-audio-card.yaml         |  70 +++
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/loongson/Kconfig                    |  26 +
 sound/soc/loongson/Makefile                   |   8 +
 sound/soc/loongson/loongson_card.c            | 237 +++++++++
 sound/soc/loongson/loongson_i2s.c             | 213 ++++++++
 sound/soc/loongson/loongson_i2s.h             |  70 +++
 sound/soc/loongson/loongson_i2s_pci.c         | 500 ++++++++++++++++++
 9 files changed, 1126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
 create mode 100644 sound/soc/loongson/Kconfig
 create mode 100644 sound/soc/loongson/Makefile
 create mode 100644 sound/soc/loongson/loongson_card.c
 create mode 100644 sound/soc/loongson/loongson_i2s.c
 create mode 100644 sound/soc/loongson/loongson_i2s.h
 create mode 100644 sound/soc/loongson/loongson_i2s_pci.c


base-commit: 62a97bea5cce5317d6d7630f7bcf0cdf5333e269
-- 
2.33.0

