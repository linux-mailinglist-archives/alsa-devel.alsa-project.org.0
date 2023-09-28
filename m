Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158137B1DF2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 15:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D86B5DED;
	Thu, 28 Sep 2023 15:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D86B5DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695907365;
	bh=svq8d0SVR8XmGLiuL7Stnbfu6iif8GF57IXKbLgJ+Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rAV6hIwPI43xb63dKDI6qEuodEd7JOzpLILk1pgSxkmasJLOLjugQhNrvARQvt6Vz
	 z8pkSbZ0VuNFZHOCKibZruqiIObjZk9li04P1MMK+eCPbU3tubKpq/CY+UrPn9aJAm
	 C2L5pJ2WDdqNQKrI/lzRMVuyq2A5ZLG15f1U5WNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B3EFF8007C; Thu, 28 Sep 2023 15:21:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CBDF8016A;
	Thu, 28 Sep 2023 15:21:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E19FF801D5; Thu, 28 Sep 2023 15:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35053F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 15:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35053F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bKvsSY3h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C14F5B81C38;
	Thu, 28 Sep 2023 13:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C5AC433C7;
	Thu, 28 Sep 2023 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907305;
	bh=svq8d0SVR8XmGLiuL7Stnbfu6iif8GF57IXKbLgJ+Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bKvsSY3hIN3yKaIhCX4oQYXIi4CUMSPcmY4yzd1TK8bAqZ6vLl6q7ykqmbtJEJl6w
	 7gJCdY75QOrhxvzC+akxmfAVc5QQujtzRtHEXU0QqOoovgNvS8ovFvopPvCWwbIk6V
	 Ec+7XiKEBXytmlT0F42iG733inftYVhcKYmjr6/Bo4OL0eh4dk2tGLouOYJqAvvyUT
	 eQELNnOCSl3HxlWQMeZz5zBGL4WKlGidQ8F3GmrD6UWGH7US0WCKycjp9nMw9LXA8s
	 ZBaqr0iacdGg4S74fQTL3m8T8nE6TfuhSMmZwcX7zs3rymNAs3N7wtz6RRtf6G1pJp
	 Fkn9SnDnBO9aw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.au@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230923174928.56824-1-biju.das.jz@bp.renesas.com>
References: <20230923174928.56824-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 0/4] Simplify obtaining I2C match data
Message-Id: <169590730318.1592771.10390430417774120111.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 14:21:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: IRWUXDJW2ZAJZVEDVDEHT2FWH7X5APG4
X-Message-ID-Hash: IRWUXDJW2ZAJZVEDVDEHT2FWH7X5APG4
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRWUXDJW2ZAJZVEDVDEHT2FWH7X5APG4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 23 Sep 2023 18:49:24 +0100, Biju Das wrote:
> This patch series aims to simplify obtaining I2C match data.
> 
> This patch series is only compile tested.
> 
> v4:
>  * Added as a series
>  * Updated commit header for all patches
>  * Updated commit description for patch#1.
> 
> [...]

Applied, thanks!

[1/4] mfd: arizona-i2c: Simplify obtaining I2C match data
      commit: 33b5b46a3bd2664a32568f7df2c7b5fd9d2873ae
[2/4] mfd: madera-i2c: Simplify obtaining I2C match data
      commit: 7a6ff7d69d9921d269b796ca0c2a96717563fe84
[3/4] mfd: max77541: Simplify obtaining I2C match data
      commit: 9abf37d4bbb20d6fb6e15a73d8e8247c8e791f46
[4/4] mfd: max8998: Simplify obtaining I2C match data and drop max8998_i2c_get_driver_data()
      commit: 36270a2599628fbd8052b3d9241f4a4b02faea7c

--
Lee Jones [李琼斯]

