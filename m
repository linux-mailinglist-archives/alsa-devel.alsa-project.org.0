Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FC48C8B7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:46:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A401B24;
	Wed, 12 Jan 2022 17:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A401B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642005975;
	bh=d1H/uOHb7hbe/NVKstK9IntyIqrjHuXgX6Hzr9Jq6ro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPohgjcIs+on1DStfWGgpa29bJMBx/D20e5c6pxiAlh62xr6I42R2hto0SuzjuBPJ
	 drRWix6H2pZFkWTCRTSM2aCcOh/o1dTwUBfwyfH9KHWwJjMJVTIpTdICnB7S86f2T3
	 7Dc6fobE/VhFbLh07wd8/xqmUleIVMKWJ1DkEdzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11354F8026D;
	Wed, 12 Jan 2022 17:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AD5F80054; Tue, 11 Jan 2022 20:46:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE78BF80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 20:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE78BF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DXpNeyKu"
Received: by mail-lf1-x130.google.com with SMTP id s30so375323lfo.7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 11:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=apllgcjqBKhHcPY4Sq8NPNisypZi4criwNIiRJZhedQ=;
 b=DXpNeyKuZmuLb0+7GiV1ndEf+fbOh4LSggvF/lB4mjqSyH/QPDWvHKtW8+wfmRxaba
 CMRbxQZXneFCfwegj3BP/5oSBWQReCyHOyGxajdzvQUBoc/sTr26Mziw45CgHIozWfbU
 lxpsYR6UzLe9x1TAsegfCo9bZRPnIE6G6pQhLcO7CJTwjzQ457+Nhrkm/RVSlqtMK2VM
 dK39vrS51bbgseP5/FX7eb/Z+dZxg009dY3os8jvlSn6J8p6UC3FJeRoQLnfCRCrijJI
 YdG2tMitceKSqcEnJy5NTmwqx+p0WTFDeq24g7NLLLO4/LlAjF4KahWVH8c4X1I/QYZL
 VGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=apllgcjqBKhHcPY4Sq8NPNisypZi4criwNIiRJZhedQ=;
 b=B2j5MsZ37PbEsUyGbC1Xqiar8q8DVG9U5kiqYCVOIE2H3rTTfwCqRjexGDz1QblSzL
 +Uoz+jBa4mWU50qe/9NGaL76SwsuA68dunDgFoSrKW+d1YeEzRdqHPB6Dys5e0JdGWs+
 B88wQE7R3Hh0ZUqq7Vb4QlI+079lSS4J96DToOVRQ2r8BgRlpa+kbHakT0HPpaF48gyv
 exYVyNx3N8J8pmvsufYRKj4eKq4aMjKVnD9t/9SaZjC+V7LMtqjej+r5NS6WmfXeGaK6
 DF8i+ryb1UdX/bI20I8o+6hr9sXEpHqQyi4eF1SBTWPUMgdd+zM9CqBq7Y6q3OUkGEs+
 ij7w==
X-Gm-Message-State: AOAM5325NXyLw+0WZGe+smujzKmk8xiIImjNSRidtOqEByDhVWicMr8o
 7JMs/vMu97ITc5CiSKkrEls=
X-Google-Smtp-Source: ABdhPJwoxw5c19Gb3/UWLAH/Kj/4pGO1pTvvZ3zzqg+dVKHuPS8luPJvCmfXz9PXtbHVwDmXmeLV8w==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr4319120lfr.187.1641930410857; 
 Tue, 11 Jan 2022 11:46:50 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id k12sm1372993ljq.91.2022.01.11.11.46.50
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 11 Jan 2022 11:46:50 -0800 (PST)
Date: Tue, 11 Jan 2022 22:52:29 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Jeremy Szu <jeremy.szu@canonical.com>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210519170357.58410-1-jeremy.szu@canonical.com>
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, open list <linux-kernel@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, tiwai@suse.com,
 Jian-Hong Pan <jhp@endlessos.org>, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>
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

Hello,

On Thu, May 20, 2021 at 01:03:53AM +0800, Jeremy Szu wrote:
>The HP EliteBook 855 G8 Notebook PC is using ALC285 codec which needs
>ALC285_FIXUP_HP_MUTE_LED fixup to make it works. After applying the
>fixup, the mute/micmute LEDs work good.

I've recently got HP EliteBook 855 G8 and it happens that neither micmute LED 
nor speakers work (except rare cases, more on that later) in 5.16.0. The 
corresponding ALC285_FIXUP_HP_MUTE_LED fixup is definitely applied (verified by 
adding a printk into alc285_fixup_hp_mute_led).

What is the most interesting, both micmute LED and speakers do work on rare 
boots. I've written some scripts to pick up sound from speakers using a 
known-good USB microphone. Out of 709 boots today only 16 ended up with working 
micmute LED and speakers.

Is there anything I can do to help with debugging of this problem?

Initially reported at https://bugzilla.kernel.org/show_bug.cgi?id=215466
