Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2886F54F
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Mar 2024 15:02:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45CE583B;
	Sun,  3 Mar 2024 15:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45CE583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709474557;
	bh=aHHeDo98C2gtHAUGfKjhxFP0caGOk5SNi6qFQET/O6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nTQDgcbgMt+GZqZJ2hZrhwRy/m7H7fskHcpg3mcRAbdUc+JspFYqYXwM3Mc3k9YHZ
	 XMAv2Q1cJO/+a3aUJW1Mz4gg0RHqzc05Zwa6uOnYYvJR3EJJa/eaXiaoGHV7KNT3gH
	 f99ADjOJ1jnr0klnrS4oMvHanRekdGvDPkk957hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00A02F805C7; Sun,  3 Mar 2024 15:01:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD8C9F805CA;
	Sun,  3 Mar 2024 15:01:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51FC6F802E8; Sun,  3 Mar 2024 15:01:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1ADBF8014B
	for <alsa-devel@alsa-project.org>; Sun,  3 Mar 2024 15:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1ADBF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aHr1o4jT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6562ECE0F8B;
	Sun,  3 Mar 2024 14:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB09C433F1;
	Sun,  3 Mar 2024 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709474476;
	bh=aHHeDo98C2gtHAUGfKjhxFP0caGOk5SNi6qFQET/O6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aHr1o4jT+8Gq7sgM1MNAc/+OIRqXJQUiUXlVDhbRFQDSJWKIuf1bt/sOuh1TiHl8x
	 dd5Z4mZECzwQ7LxsNvnQFBb/NSHBAd8bFrqjkyjSzQyBWT7GXqd7LvssY4Fb1gqLgj
	 q+Q+ku6dlCRaa0RvAQJ/TeT0QtC5b4rOWRqYv54DjuKcfAUtMO2+KJaFVlAJRsQ+XD
	 nWRGySONOZLep8N63xqwBqkYbXZwFFv6DgMC5uMI9P+ybzCJ2K3vrTsnNisTRcwrXE
	 APnMEoZSAeCieS1xA+WjYIuURqS5T49Tr/1kwWUPDtGxDDJvcr3YS4/yyal4iOzC5q
	 SkHj3Gy/C13Fg==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20230929105546.774332-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929105546.774332-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] soundwire: Use snd_soc_substream_to_rtd() to obtain
 rtd
Message-Id: <170947447421.763853.8896036097104356333.b4-ty@kernel.org>
Date: Sun, 03 Mar 2024 19:31:14 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
Message-ID-Hash: S4XYEATMAFDJFTOWBX4QE6P33K6OK5IV
X-Message-ID-Hash: S4XYEATMAFDJFTOWBX4QE6P33K6OK5IV
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4XYEATMAFDJFTOWBX4QE6P33K6OK5IV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 29 Sep 2023 12:55:46 +0200, Amadeusz Sławiński wrote:
> Utilize the helper function instead of casting from ->private_data
> directly.
> 
> 

Applied, thanks!

[1/1] soundwire: Use snd_soc_substream_to_rtd() to obtain rtd
      commit: e17aae16acf53938deb4b7702aa4f6cee2c4a073

Best regards,
-- 
~Vinod


