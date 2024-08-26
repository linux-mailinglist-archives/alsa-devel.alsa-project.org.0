Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A3996098B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6337DF6;
	Tue, 27 Aug 2024 14:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6337DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760321;
	bh=q7iT8GXC+/yBu/TQLo9oXisgLFx+sRNml6nYmwUVrF4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LBieMpy/2LcMkuJ3c5zKh2oVuszD8lVhIPwaYl+pCGJtAPeCyRzwdhyl+3Vdl4roo
	 0P2h+nm95KED/BLouhcr+Qecqn/QOFgAgQJZcHsLMwyFU/MvfBTiHBWou/Wq8WGSKR
	 gpSTKWN3deK2WQAOFOuwbGyxvyapZJ9PhUmUDIxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 264D1F805D3; Tue, 27 Aug 2024 14:03:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1421DF805BA;
	Tue, 27 Aug 2024 14:03:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A611F80518; Mon, 26 Aug 2024 15:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [178.154.239.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30566F800AC
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 15:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30566F800AC
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:24a4:0:640:473f:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id AEB436009D;
	Mon, 26 Aug 2024 16:49:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id UnTqJJ0oEKo0-29xiquGt;
	Mon, 26 Aug 2024 16:49:33 +0300
X-Yandex-Fwd: 1
Authentication-Results: 
 mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 0/1] Add support for primary mi2s on SM8250
Date: Mon, 26 Aug 2024 15:49:19 +0200
Message-ID: <20240826134920.55148-1-adrian@travitia.xyz>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: adrian@travitia.xyz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CSXI3XKFVLDPSLWAGOROS5OBZOEFEING
X-Message-ID-Hash: CSXI3XKFVLDPSLWAGOROS5OBZOEFEING
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:02:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSXI3XKFVLDPSLWAGOROS5OBZOEFEING/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds support for the primary mi2s interface on devices using SM8250
audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
SM8250 and we intend to use it as a fallback in the future.

To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@mainlining.org

Jens Reidel (1):
  ASoC: qcom: sm8250: enable primary mi2s

 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.46.0

