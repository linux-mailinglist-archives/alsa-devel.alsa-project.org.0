Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CCAC8E1B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 14:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAD060240;
	Fri, 30 May 2025 14:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAD060240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748609117;
	bh=Yizfy1XHJ4W+SiEGnJstdQkQ/isGgjlfcQVKxgOkasE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MPiAojg11DFQecNtX/SFPCs7yrUiXi8CfPf5+5sS6WHLHnc52wXnGAZNZysQNgQVC
	 TJu5QFZEhsYQJef02rikgfXn8AVv5J3TTbk5xKI9r0ij6rEcYlWKIU6u2SssF5qTpx
	 D4ZOyvZ5UwMkl0SLknp3RGgq7UNVqPWkacOpiJpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B586F80693; Fri, 30 May 2025 14:41:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA71F80C17;
	Fri, 30 May 2025 14:41:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2009F80C6F; Fri, 30 May 2025 14:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1480F80C32
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 14:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1480F80C32
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H0XRL3c9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 581D54A6DE;
	Fri, 30 May 2025 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41C3C4CEEB;
	Fri, 30 May 2025 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748608868;
	bh=Yizfy1XHJ4W+SiEGnJstdQkQ/isGgjlfcQVKxgOkasE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0XRL3c9B4orkjyAWaUtCTYn1vEBJFgEmoBcizlUfCMZIeg6e9NCETIHJS46kfgXb
	 Fadz10yIHy88F5TPcRfCrGV2DCSkEVbm+zzntIi5GmpYsFOY+NX+cdN20+VYjgxRbU
	 mcLwxclHb3/0mgflkULHxz7zNvA8Vuhwqx6H3b7FqHkGW3krRQTva6LkvT1UbS4rl3
	 mfDTpqrjB8iJvoj17h1ObAdQCXCfY9dxF6PJiQntyVRKRj3T6ryf/J727cH0oL4eo4
	 +FM0JuScCQYUxR8JvCaubAu95ynQnrLePVUzWxJJ6PgxNYUE2oabfv3JkM1xAHu2rJ
	 OAQgc1zBv73Mg==
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
Subject: [PATCH AUTOSEL 6.6 15/18] ASoC: tegra210_ahub: Add check to
 of_device_get_match_data()
Date: Fri, 30 May 2025 08:40:44 -0400
Message-Id: <20250530124047.2575954-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530124047.2575954-1-sashal@kernel.org>
References: <20250530124047.2575954-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2LZFYLIXEPSJNINS3YCABGK7LT3IWD3
X-Message-ID-Hash: P2LZFYLIXEPSJNINS3YCABGK7LT3IWD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2LZFYLIXEPSJNINS3YCABGK7LT3IWD3/>
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
index ab3c6b2544d20..140cb27f73287 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -1359,6 +1359,8 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ahub->soc_data = of_device_get_match_data(&pdev->dev);
+	if (!ahub->soc_data)
+		return -ENODEV;
 
 	platform_set_drvdata(pdev, ahub);
 
-- 
2.39.5

