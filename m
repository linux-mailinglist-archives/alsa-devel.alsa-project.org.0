Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3ED9077B5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EE3B60;
	Thu, 13 Jun 2024 18:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EE3B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294538;
	bh=Bz4DX+gNxH9XlW8R/tgQrIV6zNdeI1eX040W7bTSUjs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=InaaOmAZD7Jp9F819zKdRJDmqgxQXyeMP2w4GCm3gY9LFYSO+3KLswo0PsiYWhDFr
	 ahYs57jNQuYBrkWBv//PJ8VmLwu7Ugr2rt4PfzpQ5Gyzw2e7YWVt//XlmJueWdv3fD
	 687eM2MlEvV3JFJolR6YtLL9RoyUEcsGYTPHnwt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA734F80656; Thu, 13 Jun 2024 18:00:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF39F8064C;
	Thu, 13 Jun 2024 18:00:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF560F802DB; Sun,  2 Jun 2024 00:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AAC9F800AC
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 00:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAC9F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256
 header.s=bytemarkmx header.b=Ef6ValLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=PzOOP33dT+Tz2TGiINq9Jf04QvLUVzbMQN3na04iTuQ=; b=Ef6ValLRSROMFZsr
	aVRVRN4gECdP8JLY+tAO14n0P7xtbzcD5Fx2fcERpw+qYD9gXxXn2w/+VWE9Glj3Ijl+oNI4qT6+T
	MIXBHnpesU98tBe0AqgtX1AOA9snvGW5PA9I/1GEoiuDnzWlu+sgucIfLxmgMspXjAwUJXyexBifW
	VjPAwpWwyO/adNVfLoxujLXMhMt+lW1svR91Id/LKgW3YCxrdVggTv6uVLonYtMxPBYAPHFsPCtBH
	zyXrgAxxaLeLsJKNY4f1VkEMzTRkmpOErR/INzVGOIz/t7XQmOaz/DL0T7jUhQGbEAJT72OXhlsxI
	oCs2xHD5BlERZn29nA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sDXce-003lZO-2p;
	Sat, 01 Jun 2024 22:54:49 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] Dead structs in sound/soc/codecs
Date: Sat,  1 Jun 2024 23:54:43 +0100
Message-ID: <20240601225446.183505-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: linux@treblig.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YBH66EQNJNQ6ZBFUO6APGSRTY7FYSSA4
X-Message-ID-Hash: YBH66EQNJNQ6ZBFUO6APGSRTY7FYSSA4
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBH66EQNJNQ6ZBFUO6APGSRTY7FYSSA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Clean out a bunch of old structs in sound/soc/codecs.
Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  ASoC: codecs: lpass-rx-macro: remove unused struct
    'rx_macro_reg_mask_val'
  ASoC: codecs: wm0010: remove unused struct 'wm0010_spi_msg'
  ASoC: codecs: cx2072x: remove unused struct 'cx2072x_eq_ctrl'

 sound/soc/codecs/cx2072x.c        | 5 -----
 sound/soc/codecs/lpass-rx-macro.c | 6 ------
 sound/soc/codecs/wm0010.c         | 8 --------
 3 files changed, 19 deletions(-)

-- 
2.45.1

