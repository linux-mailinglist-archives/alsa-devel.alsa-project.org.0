Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F8398161
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 08:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4854C16DE;
	Wed,  2 Jun 2021 08:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4854C16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622616529;
	bh=V/oNkW3f8YHAz3B4v/uDbJtSRYfEsCW47+erbMG1rts=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0t9iZ+MmYvDbOe4oW24UzfPKxaUpsDkNzAsuXbaICTtMQ2qxa7Dqw3zvP6ybM2S6
	 ouNpaOl2YlV0Oyuj1RndkQKBk467DfGSLwP69Q02DVgPCCWRUnY74tLOnVnThfVpfV
	 LCyWIvLc2c+fgfKLa5jlGz/jszLsIfvPF+Z/tEdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1770F80141;
	Wed,  2 Jun 2021 08:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0211BF80424; Wed,  2 Jun 2021 08:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B6FAF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 08:47:12 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9B59FA003F;
 Wed,  2 Jun 2021 08:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9B59FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1622616430; bh=9oZydlE7ZvsDH6T9qh0iMZKszEstZjjcoeV/i59z/mE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M2C6beweJKaC2OtGnhH8ZlHfEitgurkfioMrWGLO3yHZrVOeHi0nDavbWPLAIzGaF
 kdMhKP9KO5i1XnOua7KzrGJpqA0cS2i5AozuSx59u1uu/+rPfZJWztqlKKzVhouRQT
 vr23yqiL0CihyZawpR6EH90q0w/AAiov7hiBiNsY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Jun 2021 08:47:04 +0200 (CEST)
Subject: Re: [PATCH v2] ALSA: control led: fix memory leak in
 snd_ctl_led_register
To: Dongliang Mu <mudongliangabcd@gmail.com>, tiwai@suse.com,
 dan.carpenter@oracle.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210602034136.2762497-1-mudongliangabcd@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1032c823-90aa-0144-eb7a-ff1a019c3094@perex.cz>
Date: Wed, 2 Jun 2021 08:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602034136.2762497-1-mudongliangabcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
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

On 02. 06. 21 5:41, Dongliang Mu wrote:
> The snd_ctl_led_sysfs_add and snd_ctl_led_sysfs_remove should contain
> the refcount operations in pair. However, snd_ctl_led_sysfs_remove fails
> to decrease the refcount to zero, which causes device_release never to
> be invoked. This leads to memory leak to some resources, like struct
> device_private. In addition, we also free some other similar memory
> leaks in snd_ctl_led_init/snd_ctl_led_exit.
> 
> Fix this by replacing device_del to device_unregister
> in snd_ctl_led_sysfs_remove/snd_ctl_led_init/snd_ctl_led_exit.
> 
> Note that, when CONFIG_DEBUG_KOBJECT_RELEASE is enabled, put_device will
> call kobject_release and delay the release of kobject, which will cause
> use-after-free when the memory backing the kobject is freed at once.
> 
> Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
> Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

Many thanks to you and Dan to cover this.

Revieved-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
