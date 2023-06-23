Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BFC73C1C2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 23:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2278683E;
	Fri, 23 Jun 2023 23:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2278683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687554365;
	bh=7hI9rVh1AROgGPI9A/ZuJDlHTrmVy3Qkk2LrdeMj2Kk=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pqz+UjFFiXW3/WjwxvgisXZFtaGq5knLzKo5PGhLf0xKzfn99+R+jYmPkp1BHrqha
	 CHJGOnU0pvdO97zUQpsAxxOUW7G3EqlIALOg+9lHef92dgyUMSzS5b8+GYapzp3qlF
	 TN9eqMqUoY9tVdBduew7yfsDxFWqCnRRoJLH+XR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22DD9F80169; Fri, 23 Jun 2023 23:05:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 373BEF80132;
	Fri, 23 Jun 2023 23:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AB8F80141; Fri, 23 Jun 2023 23:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A81A2F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 23:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A81A2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VlCJlzWi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 610A361B4E;
	Fri, 23 Jun 2023 21:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198ABC433C8;
	Fri, 23 Jun 2023 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687554289;
	bh=7hI9rVh1AROgGPI9A/ZuJDlHTrmVy3Qkk2LrdeMj2Kk=;
	h=From:Date:Subject:To:Cc:From;
	b=VlCJlzWiJhxlsIWBv4CSmwjV0upRi6bO6AsGQu1Ee+4kXm7LGHaaAD/uJGeLtSZjr
	 q9M9qjSpKlw+cYOXxUlhV+qwBt/zshTr73l3O7zRynpFoEINfId2hV8uMFHvPHbLib
	 DzuSLSfdOILXsnOUOu9tedmGJSejKmy+n+Rp7mTr9lV2MEaw1A7cZHj/xhZoqiwm/R
	 C581VpO+YtYn/NaaZl9NUR4dltaNMZxP6giVB+/VUmXO8vTKa72OUDIBOWQ36A7bWN
	 JPqa2n7fMeveCGq4CNTld6Lk+vgpKvSa66ztmQ26zFHZ5TbfUqwTMnQ8/x19I0yKUr
	 66I4HFPC6tFHg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 23 Jun 2023 22:04:39 +0100
Subject: [PATCH] ASoC: core: Always store of_node when getting DAI link
 component
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230623-asoc-fix-meson-probe-v1-1-82b2c2ec5ca4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOYIlmQC/x3NwQqDMBCE4VeRPXeLSazQvkrpIRvHmkMT2YVSE
 N+90ePP8DEbGTTD6NFtpPhmy7W0cJeO0hLLG5yn1uR7H/rRB45WE8/5xx9YLbxqFfB9QJqcCwI
 RalSigUVjScuBTzNeb8e0Kpo+H5+vff8DeQlCsoEAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7hI9rVh1AROgGPI9A/ZuJDlHTrmVy3Qkk2LrdeMj2Kk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBklgju/hRIWDmE+d0m//kTBjqBjvxFk+xPU8keL
 uIdzkUSermJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZJYI7gAKCRAk1otyXVSH
 0KeCB/47Tcfz9mxx4ktjj+ob071MA3r7VDmxA4L4Y8SZmFa15oo3ev5L1UnwYw02OZciRhTspyB
 DdRPC3Ws7UxmCX/cvSlAdcq9ZV6OcCzmhkTRlMC7coRblp5PuopGC40rNDXfI9pPri08Z6wGaHX
 wk3TBK6iL1Rb7u1e/QL8Z+S6SUt1OVv4L1wWytnqb34u+zx4Aa1wPF+VJb7cOtU3b2ch9urcBCw
 HzGE3jaKBWaWyhAG6irJ8zJcq2AbYXAIv99WxMahylDkz3UvAlU+cd4I2wQES+xtC7KFmxf803u
 l/CQOrhnlNf/Qe6oIyUA/KQ6qIwxnRXMLx6sRq/kfH8VvHSE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: C4PWCBJK2KU3RWX423KOQJPXYCLLOJYC
X-Message-ID-Hash: C4PWCBJK2KU3RWX423KOQJPXYCLLOJYC
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4PWCBJK2KU3RWX423KOQJPXYCLLOJYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The generic snd_soc_dai_get_dlc() contains a default translation function
for DAI names which has factored out common code in a number of card
drivers, resolving the dai_name and of_node either using a driver provided
translation function or with a generic implementation. Unfortunately the
of_node can't be set by the translation function since it currently doesn't
have an interface to do that but snd_soc_dai_get_dlc() only initialises the
of_node in the case where there is no translation function.

This breaks the Meson support after conversion to use the generic helpers
since the DPCM cards for it check which component of the SoC is connected
to each link by checking the compatible for the component and the Meson
components provide a custom operation so don't use the generic code.

Fix this and potentially other cards by unconditionally storing the node in
the dai_link_component, there shouldn't be a binding specific of_node
selected since that's how we determine the translation function.

Fixes: 2e1dbea1f8a3 ("ASoC: meson: use snd_soc_{of_}get_dlc()")
Fixes: 3c8b5861850c ("ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f06a20773a34..11bc5250ffd0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3262,6 +3262,8 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
 
+	dlc->of_node = args->np;
+
 	mutex_lock(&client_mutex);
 	for_each_component(pos) {
 		struct device_node *component_of_node = soc_component_to_node(pos);
@@ -3300,7 +3302,6 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 				id--;
 			}
 
-			dlc->of_node	= args->np;
 			dlc->dai_name	= dai->driver->name;
 			if (!dlc->dai_name)
 				dlc->dai_name = pos->name;

---
base-commit: 154756319cc6f8b8b86241da02da6a8fcc6abd1f
change-id: 20230623-asoc-fix-meson-probe-94ecd113bebb

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>

