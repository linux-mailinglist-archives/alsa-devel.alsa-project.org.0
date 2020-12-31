Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D902E7FAB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE6716F1;
	Thu, 31 Dec 2020 12:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE6716F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609414409;
	bh=gafvO2SsboqkuGmBcOCfygY9pp0gaoBExYeOVCVpd7Q=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fl4xe6o9lJVbIppfbnJRoLoFwBeSxBIK5uBKflla1n7LjIv4qmB+b9N44KqDo8Mae
	 7AWb+rtKl/HajOT3J9WVMbCmIw3ipPQjweFpOKayct0G0++M32mioW9swhfNNUM4Wg
	 ZOFQjHQU8PCifI+71mViOtjAe/060i7a/Z0bqDWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45765F8022D;
	Thu, 31 Dec 2020 12:31:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EADBF8022B; Thu, 31 Dec 2020 12:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AC40F80141
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 12:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC40F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rOWefD88"
Received: by mail-wr1-x42c.google.com with SMTP id q18so19928195wrn.1
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 03:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NetuAQ3tAGo/yEGinEHsE/lyqwm3xy3dMQvLbO/Uhjg=;
 b=rOWefD88HPMFfm4hmIR//V8/ciZbGZtTbQ3U2eM/l0BG8xJR4d+5iDms+LuFGN0oJg
 sXuYm67IEJlb4fq3loobJlLHcahWTxFb9T6Uv5tOOiNIleCl8GrGE8yi+YHSOCnI+0i5
 i1SnkfpbHrvt1cZxcKSL1NRwDePjvPoktBjtgxuX7oKUa/cmp1ax2p3TfnqS6fhlebyG
 3XJu+zxFizxzW2U/kgQR2SGRNf6k2C8nLf1ffeL1NC3+PQeIWPoeXhBtEOHWAIaE0iMS
 Jp+4YThqaH2U1rI8AzAIMt6RtUqXlOou1QRwog8lypzEqmrbn7ZQW2nBMr1SEJ18fOJr
 vPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NetuAQ3tAGo/yEGinEHsE/lyqwm3xy3dMQvLbO/Uhjg=;
 b=YwlmTy3J+mc3TZjd1Xdnb8ZJ2QnGFkuwDL/jxBTTa9Wf+H0gXib+axGPc0CBwA42nw
 X8Scx9ojR5Ad0qxm05xHy/GCfIv+PaXaTwUr6Sx+zZOFkW9/w8bvK7cPvO7BO8Qpfybf
 5bsw02JR/OcGKfWLqO8EqSWyjTy8NwEMuD87zYVmZU21tAvy8XkgTCDqgaof1atyGZGh
 3BBnQqip0sgoSHPvVVqj8q87BL9u68uFGyBN3osgUExSzV3S7lE2A7aKTq4EhRmfwX7L
 Re3e1boMMWKjtEJcYHy9EZb5Vi5TB2lryBbQYeXxtoz10gBSfE6UH++kVkjk0ZrgiY4p
 aRqA==
X-Gm-Message-State: AOAM530Pi7gWMIev+4iLU9yvmywmE+pficq7VYH1JahNRjUVU+xPE8Rc
 QIiZZOCAhskhHRjnIWc4Pj0=
X-Google-Smtp-Source: ABdhPJxLy10Wo+8i9+R2td2BnVBE8yx8EwH27vZnUZlvKHJb70Ijtc+s+4bQNgVtyOIa/S3ADwdsKQ==
X-Received: by 2002:adf:d843:: with SMTP id k3mr64975335wrl.346.1609414304212; 
 Thu, 31 Dec 2020 03:31:44 -0800 (PST)
Received: from cl-fw-1.fritz.box
 (p200300d86714220053af1ffdd671ac4f.dip0.t-ipconnect.de.
 [2003:d8:6714:2200:53af:1ffd:d671:ac4f])
 by smtp.gmail.com with ESMTPSA id t10sm67717146wrp.39.2020.12.31.03.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:43 -0800 (PST)
Message-ID: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver
From: Christian Labisch <clnetbox@gmail.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Lars-Peter Clausen
 <lars@metafoo.de>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 31 Dec 2020 12:31:42 +0100
In-Reply-To: <4c5b8a03-6508-541f-2a72-39cb3052b4f1@linux.intel.com>
References: <2f0acfa1330ca6b40bff564fd317c8029eb23453.camel@gmail.com>
 <efc6d5e8abc1da3cac754cb760fff08a1887013b.camel@gmail.com>
 <X+2MzJ7bKCQTRCd/@kroah.com>
 <a194639e-f444-da95-095d-38e07e34f72f@metafoo.de>
 <267863e8ca1464e4e433d83c5506ed871e3899b2.camel@gmail.com>
 <4c5b8a03-6508-541f-2a72-39cb3052b4f1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Akemi Yagi <toracat@elrepo.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <stable@vger.kernel.org>,
 Greg Kroah-Hartman <linux-kernel@vger.kernel.org>,
 Justin Forbes <jforbes@redhat.com>
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

Thanks Amadeusz,

Now, who has to do what ?
I assume many users will be affected !

Regards,
Christian

On Thu, 2020-12-31 at 12:20 +0100, Amadeusz Sławiński wrote:
> On 12/31/2020 11:50 AM, Christian Labisch wrote:
> > Hi Lars-Peter,
> > 
> > Thank you, please find attached the requested information from both kernels.
> > I freshly installed the fedora kernel 5.10.4 to give you the latest results.
> > 
> > Regards,
> > Christian
> > 
> > Christian Labisch
> > Red Hat Accelerator
> > clnetbox.blogspot.com
> > access.redhat.com/community
> > access.redhat.com/accelerators
> > 
> > 
> > On Thu, 2020-12-31 at 11:04 +0100, Lars-Peter Clausen wrote:
> > > On 12/31/20 9:33 AM, Greg Kroah-Hartman wrote:
> > > > On Wed, Dec 30, 2020 at 07:10:16PM +0100, Christian Labisch wrote:
> > > > > Update :
> > > > > 
> > > > > I've just tested the kernel 5.10.4 from ELRepo.
> > > > > Unfortunately nothing changed - still no sound.
> > > > Ah, sad.  Can you run 'git bisect' between 5.9 and 5.10 to determine the
> > > > commit that caused the problem?
> > > 
> > > The problem is that one driver was replaced with another driver. git
> > > bisect wont really help to narrow down why the new driver does not work.
> > > 
> > > Christian can you run the alsa-info.sh[1] script on your system and send
> > > back the result?
> > > 
> > > You say sound is not working, can you clarify that a bit? Is no sound
> > > card registered? Is it registered but output stays silent?
> > > 
> > > - Lars
> > > 
> > > [1] https://www.alsa-project.org/wiki/AlsaInfo
> > > <https://www.alsa-project.org/wiki/AlsaInfo>
> > > 
> > > 
> 
> Hi,
> 
> from reading provided files it seems that you use snd_intel_hda driver, 
> it should be possible to git bisect it between 5.9 and 5.10 as it wasn't 
> replaced.
> 
> Catpt driver is used on machines using DSP.
> 
> Amadeusz

