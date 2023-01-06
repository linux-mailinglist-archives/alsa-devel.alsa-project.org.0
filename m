Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1B660A27
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 00:17:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0104AA22F;
	Sat,  7 Jan 2023 00:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0104AA22F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673047033;
	bh=lGi/5Z84rmJAKrh6C3iND/WukibWhj8gfHsVSf6w5bs=;
	h=From:Subject:Date:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Vnmn2zcWdsbc870cXJGb7OGuHbgkyad113cJizOkZDefM7p302N6AH+b179kPGnJ2
	 zrMduA8oFPXm87ZIlAJ7lWWop1CLS6oiocDatZ6AHsbZJi9gWC2EF7dEGupT9Dlv4S
	 NRxtxYSE6MQxEo230eHnGcVCSHb2LEAhp0q0gDw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4943EF800C0;
	Sat,  7 Jan 2023 00:16:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B07C7F8024D; Sat,  7 Jan 2023 00:16:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D1EDF8022B
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 00:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1EDF8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hghpEa/V
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D03B61F6F;
 Fri,  6 Jan 2023 23:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A20C433D2;
 Fri,  6 Jan 2023 23:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673046967;
 bh=lGi/5Z84rmJAKrh6C3iND/WukibWhj8gfHsVSf6w5bs=;
 h=From:Subject:Date:To:Cc:From;
 b=hghpEa/V3Nyycedmr7JvFvjS6ArlULWLZaEBzAe9ldYgYUYBfslMZa5m8ZZG5Wu5T
 noBB0y/9t1PtkWLr9oUoUrxjVJDnhpqD8dXyv7FZi1nEb1yV77ZtrTvebH1QbVg5wB
 X8a7VJ920F7RdTIv51nouvpZijWQTq+sxFKdhzT3npIxhntLcs0z3bQRT+NG1021lW
 XZ+4TD/Ve1RRIcDrAkg1Qvfo1w2CMUo7fh9GwpxNbbkptUSuBNclOvUuWszOuXHazt
 /gxI+CQ8vc0/h0LM3hcA71BLSZhcYoJJ4ukR+zgPCagSAI7k/j12aZbDmyQyYseb78
 78zECiJF5N5UQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: fsl: Fix fsl-asoc-card AC'97 support
Date: Fri, 06 Jan 2023 23:15:06 +0000
Message-Id: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqruGMC/x2NSQrDMAwAvxJ0rsBON+hXSg+yrDaiYAWJLhDy9
 zo9zsAwC4S4SsBlWMDlraHWOuTdADxRewhq7QxjGvcppxNSGOOrmuHsVgSPh0qU05kLF+hVoRAs
 To2nrfuYPzc9u9z1+x9db+v6A+cgXb14AAAA
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lGi/5Z84rmJAKrh6C3iND/WukibWhj8gfHsVSf6w5bs=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhuQdqzd3OG5IF9G4G1JSIjdLY+LDifp1JWf3h5s7ul6TOCbS
 lSrbyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMZJ4e+3/XE/05SeK/z4k2zzd9Yh
 j+72rGBTk7/14DtxSNsDvpcjLiz3j7lYTqNEr9M12utGzZ81mrt0Hj1+fup/yOwj3tRgveF5SGH3UX
 Y9vj+Et1btZRbQ4bHr4PUVcSeBtCnLbsYlvjIZl+f6G+tv2mjO9V/+uCODZ7rpcuqGv5LKKqdEx9i9
 Lng315Wu6hvIv71Yxqp2f+NDk3af6Gb3NmhaQKrbZkP/vwhw6b+YSvbE4H/9oq525P1WZlTVQWeB0d
 Irkxw2e59G37g3IntjbfOddxMMFvs++05swlPRy2y+fu2FC86Y1WY08l25LMNeVeDUtMAsyuX9L391
 s66XKV+X/frXG8zksXHHj6M/kiAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The generic driver for Freescale cards with ASRC does not so far as I
can tell work for AC'97 cards, it's certainly not working for the two
Udoo boards I have that use it and I'm not clear how it ever worked.
These patches fix the card well enough to probe and make it through
pcm-test for playback at standard rates, though there are still issues
with capture and some playback configurations getting confused about
constraints.

To: Shengjiu Wang <shengjiu.wang@gmail.com>
To: Xiubo Li <Xiubo.Lee@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>

---
Mark Brown (2):
      ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
      ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets

 sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
 sound/soc/fsl/fsl_ssi.c       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230106-asoc-udoo-probe-54daa107cbcb

Best regards,
-- 
Mark Brown <broonie@kernel.org>
