Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823257D9E39
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 18:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD745DE5;
	Fri, 27 Oct 2023 18:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD745DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698425751;
	bh=/miI3Jk5Lw4dQlveXHkuOwWSER+qZkWRM6gODkNYp+0=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U/sdURCv8sypDYMXXexXMaIBP9Ma4/kbopNLc3BqL3y7t3QouHuSrFtnaqkZFkrhA
	 G66plShZc2fosTDUtmNDbMbubHSg4C4S4uGz0hd6P8p+BTDWZuHCMJIA6TXAQZbVe2
	 WTnxfNvsCncMlfg2XEvzx4Jk20vEZZnUAi28tFsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52BE2F80165; Fri, 27 Oct 2023 18:54:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98306F80165;
	Fri, 27 Oct 2023 18:54:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 743E3F8019B; Fri, 27 Oct 2023 18:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E321F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 18:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E321F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RZBfKnMP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 27EC2B81B1B;
	Fri, 27 Oct 2023 16:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358FEC433C8;
	Fri, 27 Oct 2023 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698425677;
	bh=/miI3Jk5Lw4dQlveXHkuOwWSER+qZkWRM6gODkNYp+0=;
	h=From:Date:Subject:To:Cc:From;
	b=RZBfKnMP9qhCgwoepEs4Ln3AguyEI+fA1qkhPgKMV1MLx5/hrkGIzZ/qbDM30s/Dv
	 BMFRJ9N2HFlbxSa/3fgoeKKNcf5gLzXQfmFu8jX2pgy+DSQe56LGhZWQb/5Zyn9baW
	 LL1eBphv9X5ncRHqbe40SdsOPp0/9Z5D2xbeURn8QhT07Q9L0ZAPA2Fc4LJC9+qToD
	 lE7IOlaWGrPcSF+bNwv67KwaGR4IuQ0Oqo/C5rvUKpJJVudjSs5GoHcsIXnw5zbKU9
	 VbQpDeep6glP4y5/HGBHEvYy8NtSPMQKhWg2WxwXA7yjZkl/xrswc+8LWonRNd7jJa
	 vD3fZtt5/cGcg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 27 Oct 2023 09:54:25 -0700
Subject: [PATCH] ASoC: codecs: aw88399: Fix -Wuninitialized in
 aw_dev_set_vcalb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231027-asoc-aw88399-fix-wuninitialized-v1-1-b1044493e4cd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEDrO2UC/x2NwQ6CMBAFf4XsmU2gFWz5FeNhhS2+xBTTohgJ/
 27jcZLJzE5ZEzTTUO2U9I2MJRZo64rGu8RZGVNhMo2xbWPOLHkZWTbnrPcc8OHtFRGxQh746sS
 9vXXdKbggXqhUnkmL9T9crsfxA0lzDm5xAAAA
To: broonie@kernel.org, wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=nathan@kernel.org;
 h=from:subject:message-id; bh=/miI3Jk5Lw4dQlveXHkuOwWSER+qZkWRM6gODkNYp+0=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKnWr33m/Hz4jz8nbWpLQUcOozOT3sI94rpb2cI/xcwv7
 zS85HCso5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkCxvDLyYHVs2Z7xbenKC7
 dF3B5Wcth7zOMPWkJpbJebyrEw4Kfsvwi5l1G4t/zsxjD1ctEI2/XKZo4sM64c62V//T45LMQ27
 asgEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: 5V2UA47GLSMHM6RSFZD5AXFWEQ3QID4Q
X-Message-ID-Hash: 5V2UA47GLSMHM6RSFZD5AXFWEQ3QID4Q
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5V2UA47GLSMHM6RSFZD5AXFWEQ3QID4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang warns (or errors with CONFIG_WERROR=y):

  sound/soc/codecs/aw88399.c:441:18: error: variable 'vsense_select' is uninitialized when used here [-Werror,-Wuninitialized]
    441 |         vsense_select = vsense_select & (~AW88399_VDSEL_MASK);
        |                         ^~~~~~~~~~~~~
  sound/soc/codecs/aw88399.c:431:28: note: initialize the variable 'vsense_select' to silence this warning
    431 |         unsigned int vsense_select, vsense_value;
        |                                   ^
        |                                    = 0
  1 error generated.

This clearly should have been using the value received from
regmap_read(). Use the correct variable to resolve the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1952
Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/aw88399.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index ce30bc7cdea9..47fe38d0def5 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -438,7 +438,7 @@ static int aw_dev_set_vcalb(struct aw88399 *aw88399)
 	if (ret)
 		return ret;
 
-	vsense_select = vsense_select & (~AW88399_VDSEL_MASK);
+	vsense_select = vsense_value & (~AW88399_VDSEL_MASK);
 
 	ret = aw88399_dev_get_icalk(aw88399, &icalk);
 	if (ret) {

---
base-commit: 60781d2d5899d6fc5fd173c1bcffaaec39643e17
change-id: 20231027-asoc-aw88399-fix-wuninitialized-63b554f8fa9a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

