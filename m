Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC10474688
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 16:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C7E1F90;
	Tue, 14 Dec 2021 16:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C7E1F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639496141;
	bh=Piq9Ela9qegVihiy+c6QFW1OZZti7AAdBR7fHukSC2E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mo7ElGKKsAANuI6+e7ZS4BC2zhYWd0TNcIMERXsk6fOy/m5o0k0bJO6qsDNE/C+uw
	 LkUs5mkwNzR7oLDFpjsbmwpyVj0c4DsusTthrHEdk0bhZPWyjmpPeMKZ2upPMOQHta
	 DIk0yMtrpvpP/rzRRQFJDZ3kysIEgJFxnRs7XFAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68149F80249;
	Tue, 14 Dec 2021 16:34:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F9EFF80246; Tue, 14 Dec 2021 16:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365E3F8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 16:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365E3F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EFQ3vqV+"
Received: by mail-lf1-x12c.google.com with SMTP id bi37so37567635lfb.5
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 07:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m/qW6OJTq+PZMI2TVoFARae55ogXm1E7P0dFW1QTwws=;
 b=EFQ3vqV+R8neb78NOg2W1d/+0znWSMA8y3MxU6ojmqf0dH1fgOK9iO8zQD9UJ4OA0N
 Asz9VV2IMp0dtwlEvwCZezbmiosrhe8h7T2SJnx79NEtnKqGF8QHE6llglwGUz5wYvqz
 Wrxd3OHTMFpD148w8gP4dKSmEFlPP83Ok/fGQBxXecb4+c0u2o0klPZGS0Zds4cMK6rt
 vFaL4CaBZRvFpU04prw4VTWMcm8bBQohFwIaAEklLB/orovPO9Mz/2bUd5c7BwToFiR4
 t59/inKbGK+L+Vx55dQWtRFuO8/NxVgGHoA567QqNGBQzIYzWSx/iNET4fNMLdzY/7LJ
 6C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/qW6OJTq+PZMI2TVoFARae55ogXm1E7P0dFW1QTwws=;
 b=IHHWg80iXxfDP7urfC8nda+BLAJlIgfqMO3AFGpwPInZkw6TuFwdTpVY2odYe03ozc
 JL7mzsVRI5MnjK9m6ZEDgAw4+gmPf+UVOmfC3uW7E7Wxb29MeIZMqOS6dhUFM4yL8ZAf
 KIfEaxuNPJOw0Tp9CRMWP8/SZAYu+cguSOhdNv+d0BzKM6dQ6H3Ow8FseGEj8cKS84kc
 Fsd5hYDuhOMWn9TTCB+4J/GJKWYedhmBidR6FNuVimgv/xj1Y3u7mHBUjALtM9WhvFFp
 KhVKp5cIqSD0k31nS48F6Xb/L0BJtMxUzp2E5zVB5LwcvIqoQ3kDw5RBYdyRJ0reK9DI
 IQig==
X-Gm-Message-State: AOAM531dgEr7kZHcaOEa3Lf9cQ1nc4zrWCvwL8eDdT5/Xd+5CN+kv8jZ
 C2CBBUaKa4u0VxG2U02UNnDcP4oREPY=
X-Google-Smtp-Source: ABdhPJzwtl22wgbOJNUiLRvzjqIzb84KHkq1ypWVWnAF32iWfkeJGaGZLEBcU+zP+CWTwxWsKtRnog==
X-Received: by 2002:a19:c350:: with SMTP id t77mr5415981lff.152.1639496066375; 
 Tue, 14 Dec 2021 07:34:26 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id g27sm14872lfe.55.2021.12.14.07.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:34:26 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Takashi Iwai <tiwai@suse.de>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
 <56bb43b6-8d72-b1de-4402-a2cb31707bd9@gmail.com>
 <4855e9c4-e4c2-528b-c9ad-2be7209dc62a@nvidia.com>
 <5d441571-c1c2-5433-729f-86d6396c2853@gmail.com>
 <f32cde65-63dc-67f8-ded8-b58ea5e89f4e@nvidia.com>
 <95cc7efa-251c-690b-9afa-53ee9e052c34@gmail.com>
 <148fba18-5d14-d342-0eb9-4ff224cc58ad@nvidia.com>
 <3b0de739-7866-3886-be9c-a853c746f8b7@gmail.com>
 <73d04377-9898-930b-09db-bb6c4b3eb90a@nvidia.com>
 <ad388f5e-6f60-cf78-8510-87aec8524e33@gmail.com>
 <50bf5a83-051e-8c12-6502-aabd8edd0a72@nvidia.com>
 <7230ad0b-2b04-4f1b-b616-b7d98789ded0@gmail.com>
 <48f891bc-d8f6-2634-6dd1-6ea4f14ae6a3@nvidia.com>
 <0761f6f2-27f8-4e1a-fabc-9d319f465a9e@gmail.com>
 <s5hv8zr9s5a.wl-tiwai@suse.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b7ad34b4-02be-00ed-05e2-12ea31ababb2@gmail.com>
Date: Tue, 14 Dec 2021 18:34:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <s5hv8zr9s5a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, stable@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 Mohan Kumar <mkumard@nvidia.com>
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

14.12.2021 17:29, Takashi Iwai пишет:
>> I'm also wondering whether snd_power_change_state() should be moved into
>> RPM callbacks and whether this function does anything practically useful
>> on Tegra at all.
> This call is mostly for ALSA core stuff, and not necessarily
> reflecting the exact device power state.  The major role is for
> controlling / blocking the device accesses at the system
> suspend/resume, so it's correct to set only in the system
> suspend/resume callbacks, not in runtime PM.
> 

Thank you for the clarification.
