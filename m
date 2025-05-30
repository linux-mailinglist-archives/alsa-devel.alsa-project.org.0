Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424CAC8E40
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02EC6027B;
	Fri, 30 May 2025 14:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02EC6027B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748609239;
	bh=SumBUkfrG0wtiXyJpufWgfiVWH6WVko4x6bFVrjMH5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iDRps7Bewhu3OvSqan3yLgpbjfoQWEQ/RpAZ6ad5XCrM1vPyqeeWPHwCsnMUF4wIl
	 OwVChZJBw2iGFd+DqMyNyj19+tev/Ea8URAD7mkmo4VwxUMOZ3M4vyGtll4UNqpUUv
	 +ATnjD2AAyyE0zDQ1xpeUxSsa6TdcO96bc3K369A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2266CF896FB; Fri, 30 May 2025 14:42:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBFCF806D6;
	Fri, 30 May 2025 14:42:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0136CF896F2; Fri, 30 May 2025 14:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E7AFF805EC
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7AFF805EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NeC7whn8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 206C64A6DE;
	Fri, 30 May 2025 12:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C67C4CEE9;
	Fri, 30 May 2025 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608920;
	bh=SumBUkfrG0wtiXyJpufWgfiVWH6WVko4x6bFVrjMH5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NeC7whn8F853I4IKmleFBufFOSaWENFYe1bEYHUB7ARmTzhBDzz+WGM0LvVRyhNxv
	 GmmKcCt0G/dj7QQ1/F1SqsPUhk4xuZEhxI8h1Ww7DGSAg98rmKuugy2O6ev9OfGP3j
	 TviNsPyYqZlc+G09dChxl7F3Q3hkEYAZtM6PeSIvJZ+mZe7bKObLWlEcpJ5iz2DD3b
	 zIeGTFoxA7NZ2cm0mspxQEupz/h+lviqcmXCFJyBKhZrhm40F7HY4FhHO3wtQtSS7y
	 fbvIgX47hRhle0vA04o/u8Tk/iHXH0Q5rAzWxH9+CpE2z/wXCQoUQZFgY/wLHzAz0n
	 GW3PPdwfTR6Fw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/10] ASoC: tegra210_ahub: Add check to
 of_device_get_match_data()
Date: Fri, 30 May 2025 08:41:46 -0400
Message-Id: <20250530124148.2576913-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530124148.2576913-1-sashal@kernel.org>
References: <20250530124148.2576913-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RUM6VS4OY4J2GW37HQRLJPV4AXJHDNUZ
X-Message-ID-Hash: RUM6VS4OY4J2GW37HQRLJPV4AXJHDNUZ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUM6VS4OY4J2GW37HQRLJPV4AXJHDNUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yuanjun Gong <ruc_gongyuanjun@163.com>

[ Upstream commit 04cb269c204398763a620d426cbee43064854000 ]

In tegra_ahub_probe(), check the result of function
of_device_get_match_data(), return an error code in case it fails.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
Link: https://patch.msgid.link/20250513123744.3041724-1-ruc_gongyuanjun@163.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Extensive Analysis:** **1. Nature of the Bug Fix:** This commit fixes
a critical null pointer dereference vulnerability in the tegra210_ahub
driver. The code calls `of_device_get_match_data(&pdev->dev)` but never
validates the return value before using `ahub->soc_data`. Looking at the
kernel tree, we can see that immediately after the assignment, the code
accesses `ahub->soc_data->regmap_config` and later
`ahub->soc_data->cmpnt_drv`, `ahub->soc_data->dai_drv`, and
`ahub->soc_data->num_dais` without any null checking. **2. Severity and
Impact:** - **High severity**: A null pointer dereference in the kernel
probe function can cause kernel panic - **User impact**: Systems using
Tegra210 audio hardware could crash during device initialization -
**Subsystem criticality**: Audio subsystem failure affects multimedia
functionality **3. Code Analysis:** The fix is minimal and surgical:
```c ahub->soc_data = of_device_get_match_data(&pdev->dev); +if
(!ahub->soc_data) + return -ENODEV; ``` This follows established kernel
patterns and returns an appropriate error code (-ENODEV) when device
match data cannot be found. **4. Consistency with Similar Fixes:**
Examining the kernel tree reveals that other Tegra drivers have already
been fixed with identical patterns: - `tegra30_ahub.c` already has this
null check (returns -EINVAL) - `tegra30_i2s.c` already has this null
check (returns -ENODEV) This indicates that tegra210_ahub was an
oversight that should be corrected for consistency and safety. **5.
Historical Reference Analysis:** While the provided historical commits
all have "Backport Status: NO", they were primarily code cleanup and API
migration commits (switching to `of_device_get_match_data`), not
security/stability fixes. This commit is fundamentally different - it's
a critical bug fix that prevents kernel crashes. **6. Stable Tree
Criteria Compliance:** - ✅ **Important bugfix**: Prevents kernel panic -
✅ **Minimal risk**: Two-line addition with well-established pattern - ✅
**Small and contained**: No architectural changes - ✅ **Clear purpose**:
Prevents null pointer dereference - ✅ **Subsystem confined**: Only
affects tegra210_ahub driver **7. Risk Assessment:** - **Regression
risk**: Extremely low - only adds a safety check - **Side effects**:
None - failure case now returns clean error instead of crashing -
**Testing impact**: Improves robustness without changing successful code
paths **Conclusion:** This is a textbook example of a commit that should
be backported to stable trees. It fixes a critical null pointer
dereference that can cause kernel panics, uses minimal code changes
following established patterns, and has virtually no risk of introducing
regressions. The fix brings tegra210_ahub in line with other Tegra
drivers that already have this protection.

 sound/soc/tegra/tegra210_ahub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 1b2f7cb8c6adc..686c8ff46ec8a 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -607,6 +607,8 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ahub->soc_data = of_device_get_match_data(&pdev->dev);
+	if (!ahub->soc_data)
+		return -ENODEV;
 
 	platform_set_drvdata(pdev, ahub);
 
-- 
2.39.5

