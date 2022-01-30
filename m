Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC204A35D9
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jan 2022 12:05:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A2216A5;
	Sun, 30 Jan 2022 12:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A2216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643540742;
	bh=JBPdeJ4PaQ6OYELVdpAGX57frLYhSXkpAHtkPXNDVk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SreZc3e0mz5TvNb9I6rEmFmy2WRx2LdNdwV0qbCo39IOQ0FbVH5jp5SrHnMzFjkgR
	 3k1UPkgxIh5RQdKvVOfJ4yiAUqiDFbV0sdw8vADVni5g0pA+Yc8a364QAHDLMUmF3A
	 c6pTkAFExixHP7iluLoPy77AFTg7L19Nq86cFyMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D1AF8016C;
	Sun, 30 Jan 2022 12:04:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C29CDF8014B; Sun, 30 Jan 2022 12:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD841F8014B
 for <alsa-devel@alsa-project.org>; Sun, 30 Jan 2022 12:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD841F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rb+lSRxH"
Received: by mail-lf1-x135.google.com with SMTP id x7so20945125lfu.8
 for <alsa-devel@alsa-project.org>; Sun, 30 Jan 2022 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=bxlyxF/EC8bTAR3d0TLEeaeVlQi35TqmVD7n3vCbavI=;
 b=Rb+lSRxHbxob/Ic74S73x7dboMK/vjsrOhLRmlHXTY0UcvDe+A01djucQTLJ5aF0ee
 xaJgTd18lCL2S8NbZijvYwTjO8qchTw30veISMMMDYNrugj94BEtCr15/4cPBQWS+4gU
 tcauokmFlOU8h724lMEBMYYiRfvei97Sdk61ECGSY1+BmRvyJban3pz4329P7NNUTUF4
 sVVzfmUYpidWtqVlrS8fKR8LvLk2TqINYr1FU6qvbgRJs3Igr1BcVMcVBtPHlVrMhsLW
 f3eoZ8ev9id5iL7KT4BWNbCoj5uS+FZO0JUXc8Jd0l0osPFfN7A9UsH5kVWogfQHxXeF
 8S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=bxlyxF/EC8bTAR3d0TLEeaeVlQi35TqmVD7n3vCbavI=;
 b=0dXLH9R5vFwTyKrzhBjLIxPeZqxzOKZgjODsapWftDGSOnqVqoDZ3K/wY23eS52tye
 IDlE+nBvx4Axi7v+tTzPL/V7dIbPbgOaIdToPEd3h+HwKdXBfMCSjoLaBrkfPR6Oc/lM
 eDhbwi4QQK7kc3OccA1FBd9qOIjDeZoGQvfMKmkqFaRIuH7Ah8cZdUa0C7JpshhfAqDj
 FzrIGMz3cKIR016x35jW9KY9QwHrrL/Fi9EIN4crJ0qLLArpZpD1orMheY29rY3dYtWW
 RL+r/1BYX7UdxJwhVadEKM+bKi0EC8cGomLqRAg+lfQ7dCuGlWst9xcux0xLGRhpvlKk
 xmkQ==
X-Gm-Message-State: AOAM5322dWq6TTRe6B1Meo0b3/wIXE+/37zLepMGsIi7o0lidtr1HGh8
 niTSDAez1Z6WhbUXtQBKuEE3YNEjCfc=
X-Google-Smtp-Source: ABdhPJwjyY27OzuJcBoolWvFSnRfBiH5kr2z5VBWsTElJy1GUg5fFtub5fpPbFklnrBgvEpgTiJrfw==
X-Received: by 2002:a05:6512:3223:: with SMTP id
 f3mr11654547lfe.203.1643540668159; 
 Sun, 30 Jan 2022 03:04:28 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id z3sm3247459lfu.8.2022.01.30.03.04.26
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 30 Jan 2022 03:04:27 -0800 (PST)
Date: Sun, 30 Jan 2022 14:10:20 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220130111020.44gzrm5ckrakjta2@localhost.localdomain>
User-Agent: mtt
References: <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
 <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Sat, Jan 29, 2022 at 05:47:07PM +0300, Alexander Sergeyev wrote:
> But unbind-bind problems with IO_PAGE_FAULT and "out of range cmd" are not 
> eliminated. IO_PAGE_FAULT are often logged without accompanying "out of range 
> cmd". And after adding debugging printk() I haven't managed to trigger "out 
> of range cmd" yet. But IO_PAGE_FAULT are more easily triggered.

IO_PAGE_FAULTs go away with CONFIG_IOMMU_DEFAULT_PASSTHROUGH enabled. As I 
understand, this leads to reduced DMA device isolation which is generally not 
desirable. I was initially thinking about races between some delayed code and 
io-memory pages unmapping, but first IO_PAGE_FAULTs (running non-passthrough 
iommu) happen during bind operations as well.

What is also interesting, unbind & bind consistently fails on 31th bind:

echo -n '0000:05:00.6' > /sys/bus/pci/drivers/snd_hda_intel/bind
-bash: echo: write error: No such device

And does not recover from there until a reboot.
