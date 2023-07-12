Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EABE751086
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E567F8;
	Wed, 12 Jul 2023 20:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E567F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689186680;
	bh=bZ7oMDo6TetHzny17+cqbk3vmMgEP+gPg2CRz685Tzs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iPTDYBE+OI3CBq0Y4LGhDI2ram+Slp0d1PqHdUDbnbXkHk0rbnb8j5xBAxjNHWh9s
	 J0M7gjSz7Pk3WJwG8x0XVXye7jD/1Tyzsvo/g0P6qjNT9nNZzI+5FvOWM5Np0jLqSG
	 HUJ3UfKYd73z6R9ata4EpXHOscQWhJ3NvVF4vM4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC578F80548; Wed, 12 Jul 2023 20:30:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C977DF80249;
	Wed, 12 Jul 2023 20:30:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94FD6F80290; Wed, 12 Jul 2023 20:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EAD3F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EAD3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fo9LvMho
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69E32618CC;
	Wed, 12 Jul 2023 18:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F0AC433C7;
	Wed, 12 Jul 2023 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186589;
	bh=bZ7oMDo6TetHzny17+cqbk3vmMgEP+gPg2CRz685Tzs=;
	h=From:Subject:Date:To:Cc:From;
	b=fo9LvMhokSCsTu3AGoa0oU8P/fxOUKFy5XXpYMsDN63aS4TXcP5krOoOH+PvZpm9t
	 NtuwpqBnGIW/NaCcErUkjylH2NcJvHW6pxffTPmNzx/wvV7FuIU76ZOp6banwRfobP
	 xACpD8Xfv72fXSpB+Cm8Z0IzfTlvGT7Egcof0+/9IV0HlFP7nE2dmZPTFFjJjHC/Ku
	 82RfrRM9PiuBYRbc8D8SW/2AEdAq/PnAT3wvtYMBt6AvWfIlHmWwwDTEkcfY4jfSiR
	 f/k73FplhRfbvpMH+kh5vakIyPnmgVI+2d0ziSg27mZtommKTbKzlNoPO6KFD/2vlS
	 uIV33q9lGe8Nw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: qcom: Use the maple tree register cache
Date: Wed, 12 Jul 2023 19:29:31 +0100
Message-Id: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvxrmQC/x3MQQqAIBBA0avErBuwKYq6SrQQG2ug1BQiCO+et
 HyL/19IHIUTTNULkW9J4l1BU1dgdu02RlmLgRS1qqcRdfIGL+NPPHU4GBXp1dpuYOotlCpEtvL
 8x3nJ+QP54/pbYQAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bZ7oMDo6TetHzny17+cqbk3vmMgEP+gPg2CRz685Tzs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvEW62rgkQNEGQXprYAoEUJv4XNuibhCy6Mrl
 7yw2jsonFKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7xFgAKCRAk1otyXVSH
 0K0BCACFDesHJ/aQBdAeAUIdzvEEV3jgx+tNZtw+nHjEWvTUYE59jScOgkqlr3aRbRIIVvBee78
 tDQ3OzxkRw/iONM/6eYZujzJmYu77VXNUQJqxjdhwvKd7OSm0HyxpAj7K7v9eB0UcBjMmdbneYv
 l1Fax/TbI8haPf95jzVYtcYlWWc/vWbjh9JPMIbnvxYkxwLCnrC3IGLBXF+2uYRe8lBbCd53rZj
 0qBdpu1EL9en8886mYAqlz6woawBvWaGZHlvRJspjGBIvQNY+XU/ROeBJ+yd5e63XcwCoUJ5mbp
 PrWsF3X9DG7dKcR8ySDujfwU/DrLEsUGMok3F5uME/dRiyg5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: SHSVS4Q5YOWUXKFZOEWN2OJUZDBEO7E5
X-Message-ID-Hash: SHSVS4Q5YOWUXKFZOEWN2OJUZDBEO7E5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHSVS4Q5YOWUXKFZOEWN2OJUZDBEO7E5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache should now be a good replacement for the
rbtree cache in almost all situations, update the Qualcomm CODEC drivers
to use the newer cache.

---
Mark Brown (4):
      ASoC: wcd9335: Update to use maple tree register cache
      ASoC: wcd938x: Update to use maple tree register cache
      ASoC: wsa881x: Update to use maple tree register cache
      ASoC: wsa883x: Update to use maple tree register cache

 sound/soc/codecs/wcd9335.c     | 2 +-
 sound/soc/codecs/wcd938x-sdw.c | 2 +-
 sound/soc/codecs/wsa881x.c     | 2 +-
 sound/soc/codecs/wsa883x.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230629-asoc-qcom-maple-02adff47e26f

Best regards,
-- 
Mark Brown <broonie@kernel.org>

