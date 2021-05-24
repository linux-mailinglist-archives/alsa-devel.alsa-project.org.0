Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F138E364
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 11:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB7D166E;
	Mon, 24 May 2021 11:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB7D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621848841;
	bh=qnqJtHnVS98sBaOIc2TRh7jkP/LShh+RvgGb/IXmEnc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZD1RovOZQG8x/2lwgMCJGuJdnjBzkIzT19s/ZY10ywMWPBSY7AP4ZLuZUfgrMtt/
	 ugEfG+jx3aenxmlrpIe6TI9ICIacEkz+cPAxXMyZUT3xK8tmzDXj6tvr1Dn1W8oHQP
	 qMz5FIpPQrMGBybivWtMiwD1JTFdDa8EXt+9iFRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 688D6F8022D;
	Mon, 24 May 2021 11:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE020F8022B; Mon, 24 May 2021 11:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2580F80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 11:32:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 49D1EA0046;
 Mon, 24 May 2021 11:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 49D1EA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621848742; bh=bXWKKEDvIO+Sczogu8K2csQsC0X7TIoN6kBJRrBf8l0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fR7s0++SQrKjTg9ElqgWfmIB3wPfrkz+GXpJKixZDozuLsTbL8KCYrtEraqtZmYth
 B7qie2nqrgx9WL/9YyIZo1EeIu5SmBL9lSqaSvNkihkMJ7P0kL6zv+kzIViC3Q38WD
 AA1jb1Ovw4eymbQTy43+aeFyaG0d0YD2a4JZHsnQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 24 May 2021 11:32:19 +0200 (CEST)
Subject: Re: [PATCH v2 0/6] ALSA: Prep work for PCI rescan support
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210523090920.15345-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <04f9b52d-872d-0f44-4c2d-d10c74aa3472@perex.cz>
Date: Mon, 24 May 2021 11:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523090920.15345-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>
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

Dne 23. 05. 21 v 11:09 Takashi Iwai napsal(a):
> Hi,
> 
> this is a revised patch set as a prep work for the future-planned PCI
> rescan support(*).  The essential part is the patch to track in-flight
> tasks, and the rest are cleanups and fixes in the core code.  With
> those changes, the driver can perform a sort of software suspend on
> the device without the hardware intervention, which is required during
> the PCI BAR movement, for example.
> 
> v1->v2:
> * Move / drop unnecessary snd_power_wait() calls
> * Rephrase changelogs and comments, reorder patches

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> 
> 
> Takashi
> 
> (*) https://lore.kernel.org/alsa-devel/e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com/
> 
> ===
> 
> Takashi Iwai (6):
>   ALSA: core: Use READ_ONCE() / WRITE_ONCE() for power state change
>   ALSA: control: Track in-flight control read/write/tlv accesses
>   ALSA: control: Drop superfluous snd_power_wait() calls
>   ALSA: control: Minor optimization for SNDRV_CTL_IOCTL_POWER_STATE
>   ALSA: Drop superfluous argument from snd_power_wait()
>   ALSA: pcm: Block the release until the system resume finishes
> 
>  include/sound/core.h        | 50 ++++++++++++++++++++++++++++++++++---
>  sound/core/control.c        | 38 +++++++++++++---------------
>  sound/core/control_compat.c | 14 +++--------
>  sound/core/init.c           | 46 ++++++++++++++++++++++++++++------
>  sound/core/pcm_native.c     |  6 ++++-
>  sound/soc/soc-core.c        |  2 +-
>  sound/usb/usx2y/us122l.c    |  2 +-
>  7 files changed, 113 insertions(+), 45 deletions(-)
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
