Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D148EE0C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 17:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2C61F82;
	Fri, 14 Jan 2022 17:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2C61F82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642177476;
	bh=42zPbb0yroZukcZ5WPJ2D+PdN5fgMopF24EmDtHwsH4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4nE/7vV0nQB/U4yWe5yvLRCgtes/PxVeCwDNIUNpveDB3A7dthJPc+ohoqPvHrTA
	 V2Qz9Zf9KTGXoWXvvSeVDCrpmy/RdUobkMGWvZTDIKhfMCYPI6RvTK/kikNbF+iT87
	 5w2ubMJk78ZG+Ah91Lo4b4SRqOyDkqlnvPZRtRLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 253CAF80310;
	Fri, 14 Jan 2022 17:23:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02D53F8030F; Fri, 14 Jan 2022 17:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA94F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 17:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA94F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E5AwvZ8X"
Received: by mail-lf1-x12b.google.com with SMTP id x22so31789015lfd.10
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 08:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=42zPbb0yroZukcZ5WPJ2D+PdN5fgMopF24EmDtHwsH4=;
 b=E5AwvZ8XcO+MsT9Hq92x30gcmZmZqPYcSC+iuhS9vWpX6JEbk+/JsTyTk/UL8/9wzm
 CBKUeKeamZDJYUaB/sZ9mXo8xCA1OhAfe8ZYXOxhJ1k6oiH3zfCEiYLrLklRNMOCZOO5
 3HreIIzMhmoim1gKEOJzbOQkJSI3wY+CVS9dg94jQfkIsUgboAJ1ThBq1TiP5GkwF3pW
 zS9LuGVuF6dfrlx2mTjRd1M6DkgK924sC8RNJlBTkUKh2lpTtvgOE7/dBVko+s6Mm+6A
 z+EnOACdOWOS0NDOUhuUGaRIlVEoNSosAbPWEShtX1Hyw3qgzxOx84PdodTaR19YUjdR
 TIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=42zPbb0yroZukcZ5WPJ2D+PdN5fgMopF24EmDtHwsH4=;
 b=sySsC6WN0KbXxwyJ/plOZ/uhT7H2wQCK9FCgnBNR3x+N770kBX9H4WJwS1GAxjI0ag
 1CNEvaKvJrfxH/1KlVB1bk7xuUVGlkzBnqVtrO2l7pbR1G6HSdgm1Wytb6l84zDqJa0C
 ueg3fAJb7Drxs4hagmvgzPuIlKHcGq6wHURZL1MyghdUvkcwgAzf04lQMbsmri7r1jB5
 /UfyVOgPiBKrhNgN7M2DBZMJV17to7EV3iGGe9LNmlypJTGgC1lKTMdBjQvbHL/H6r7Y
 FgigVOVaXsrjNoYKl5J0xOzMgadcXl7+v4xuw+BrhS/SMPWhx6vrZHyxm5weCdG7rqLl
 bm/g==
X-Gm-Message-State: AOAM530BDvzYeuO45xiUM6yqBL/ucOzwOx/TBnEQ5yeQhU76mz7RwAsW
 YWYe3el6su67Vtm/bBWEUXOzaw9Ptrv1EA==
X-Google-Smtp-Source: ABdhPJwxqYTPEnm/szEKg/tWZvhyJXTB2ySl61arfJl0qseHH8097Qm/FF0M8jMMM7V/tSGRMpHWcA==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr974222lji.11.1642177403033;
 Fri, 14 Jan 2022 08:23:23 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id k19sm624295lfu.176.2022.01.14.08.23.21
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 14 Jan 2022 08:23:22 -0800 (PST)
Date: Fri, 14 Jan 2022 19:29:03 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: fix speakers and micmute on HP 855 G8
Message-ID: <20220114162903.fbdejorf5ibia4sw@localhost.localdomain>
User-Agent: mtt
References: <20220113210930.dtryx4ifjsmb33lz@localhost.localdomain>
 <s5hh7a647vw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5hh7a647vw.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
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

On Fri, Jan 14, 2022 at 05:08:51PM +0100, Takashi Iwai wrote:
>The change looks OK, but it doesn't apply to the latest tree.
>Could you rebase it with either sound.git tree for-linus branch or
>the latest Linus tree, and resubmit?

Sure, I'll rebase on the sound.git branch.
