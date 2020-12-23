Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597672E125C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE9721798;
	Wed, 23 Dec 2020 03:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE9721798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690165;
	bh=KuOG9RquJ7QFLzwKgzbgeMWHTrQstCtDKvaba1UF2F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0dHngAl4yhr8HhEhq9ABB1QgYkHPRhacPx5mHLwnohItHLJnVtjvQt91cAj4R55j
	 JWmU9qrLuUbyaHY6AJTvQtrc+oU9OQRPMiIekTMWmWuXdWfKsAfAVzQnviRKc9i4kq
	 Slx/P0Uy0G/DSwmmxZtbLm/PUv1f5CLef+uzZ9lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4DFF804CA;
	Wed, 23 Dec 2020 03:20:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38A4AF80212; Wed, 23 Dec 2020 03:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D900F8021C
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D900F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r4zNmavU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D01D2222D;
 Wed, 23 Dec 2020 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690016;
 bh=KuOG9RquJ7QFLzwKgzbgeMWHTrQstCtDKvaba1UF2F0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r4zNmavUNxKGJ/637KEW/wFZB6L9C0QCFgJ5u76mLzg4XjrYxLLbOWSGe+P85U5gW
 dxG4biRO5nVJAfvsnHN0pJptD+OfungOfHiifVtXd9EXyTmnoEC8WZTEcIuiVX93V+
 6iXrAFyF/p5CD3TWW0DUFURt/q4HjMMEUgPW60Gt4rxBSMhbKbgv5one+pQy8DGmsc
 hnSdJto7inHS/5mwjAcurd1q2fxaHjqEki56z5Ua0xPXFggQqXQP4hoKmAui0NlVXl
 9UY2zceeEhUmLHmk69H9mLwPGcMrhEwJ7dQzyPutIiz8JTLrk4x4pSePzIryF+Avh1
 +67D/H8eHOM9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 095/130] ASoC: Intel: cht_bsw_nau8824: Change
 SSP2-Codec DAI id to 0
Date: Tue, 22 Dec 2020 21:17:38 -0500
Message-Id: <20201223021813.2791612-95-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 748e72e869718db8d735d773040bce95158c98c6 ]

The snd-soc-sst-acpi driver does not care about the id specified for
the SSP2-Codec DAI, but it does matter for the snd-sof-acpi driver;
and when it is not 0 then the snd-sof-acpi driver does not work.

Set the SSP2-Codec DAI id to 0, fixing the snd-sof-acpi driver not
working on devices using the cht_bsw_nau8824 machine-driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20201206122436.13553-3-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/cht_bsw_nau8824.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 501bad3976fbf..bea1372b416e2 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -218,7 +218,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	{
 		/* SSP2 - Codec */
 		.name = "SSP2-Codec",
-		.id = 1,
+		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_IB_NF
 			| SND_SOC_DAIFMT_CBS_CFS,
-- 
2.27.0

