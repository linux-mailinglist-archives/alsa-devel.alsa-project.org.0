Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DA114A99
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 02:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD4A8166D;
	Fri,  6 Dec 2019 02:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD4A8166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575596899;
	bh=BHWvHzt2DwUSL+wyLBEKUUnmJ1Q1rWUjpNz1CUcSLag=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXpXmkdPKrGzZIOHnRMpNPKO58g8UZcms5C30NJOTxwUld3eO/iVtWbfuXE0zN0R3
	 +FOZ+c4+g3z2rJ0Ak35s0pD0hfniBsBLFnZHt6JDOOsteI0GgFh7wsxZTdtRrIANdr
	 KRQ4GI4QXimJrkEsDjVYTAw3Y6gf/8hQznxxN9E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E98F801F8;
	Fri,  6 Dec 2019 02:46:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D1D0F801F8; Fri,  6 Dec 2019 02:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688BBF800F6
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 02:46:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688BBF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="RJjJ3wcj"
Received: by mail-qt1-x842.google.com with SMTP id k11so5599485qtm.3
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 17:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWbR15S2RfRqJyFwqLxBwXeFj+8GFIYqLV64PVIuJyM=;
 b=RJjJ3wcj14dVHpVkD5y/VdYzM098tUTqND4K28eHNEvwqzNgDGlLTtMxMg+mgKaX/4
 7OF3LV5xDPeoHfeAjJgLpOYgRqmQfbIp3dXN0n2VIOrTsCcKcU2lTqY4hgBXCQw0J9qB
 5YYmz3wH/uXzQ4bzWY7fIZi1zrLpd1byzeYLWojHxkKd0bvMDfcdP0PYUGqC5ChpELXY
 H0p/tylfLIbnOywoplsQbXpyfBtYCglWp1q95slxGueeo6Jdiv4yA0h7bxIrHt71hAvx
 uDgCD4YBNXUNR2u4Cgl1Nyxs5NjKrDDHoabHUsjCOBvwQvRJ2HscveVyfpHjJfAz7fBN
 +/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWbR15S2RfRqJyFwqLxBwXeFj+8GFIYqLV64PVIuJyM=;
 b=flwnNaLjbsQmj2lQqziL7tV8d1NIdTXZjv8Rc8K/RTstJRCYLSBIZU03j8yp7/rd4X
 ipcC9MzNqdLjxQ3NbvmKVw7CauAEp1lVyPbBdlkZ012YnhuaDYDCMrjI2Udf5LuJ+YJV
 p0EHphLG2oKPy3s1uyyjhKTLD7ziqbW3nQOcVx2MEd/K3aBxKZhT7xA26K1YGaqNanBQ
 opSjtdc79KcSpzfDmBoOzxSLc3WUot2NqBSzT3ERkkWygbKnPGtDhIvDuC7sJUOe8wMK
 WcKTBjD0Lb4EgUfP6+6opftfgtoqrQfvaVq51kJpFD86KJ62QuVLv1Ku4OkFQrnKavgJ
 T9vQ==
X-Gm-Message-State: APjAAAWad8FNpUWsgptWY+ZAc8hE3xHYyMJ68jshj9Df5zklxrzQN0Cc
 BdWM7tpse8d/HqicXs++sl4rcoRaacCrBn479UggLg==
X-Google-Smtp-Source: APXvYqwtg2K3Mzf77oJxzFBZgf+wjezo+Lbx4VT1iUQsHrH76010514gsaMvd+kVmMBWdRWQNgfWL1295KVZqcbNHME=
X-Received: by 2002:ac8:6f75:: with SMTP id u21mr10913214qtv.52.1575596787983; 
 Thu, 05 Dec 2019 17:46:27 -0800 (PST)
MIME-Version: 1.0
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
 <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
 <CAOReqxj3P4Kvf5YwTXoEzHd9hURBOP4ySEjURsO7LjK+vbpQTw@mail.gmail.com>
 <2f0297fa-4aab-b463-4652-208ee77b6cb8@perex.cz>
 <5985f899-82d0-cbb9-9981-1eb9aa5a935d@linux.intel.com>
In-Reply-To: <5985f899-82d0-cbb9-9981-1eb9aa5a935d@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 5 Dec 2019 17:46:17 -0800
Message-ID: <CAOReqxg2=e0b44Uxj2gfc+4aqKn6OBo6rCX4oGZLBvvpXci8HA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 =?UTF-8?Q?Mads_L=C3=B8nsethagen?= <mads@ab3.no>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 3, 2019 at 4:34 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
>
> >> It appears some have started landing
> >> upstream ae09a4783b9caf9307f303ef039f8297ce0371fe ("ASoC: Intel: Headset
> >> button support in kabylake machine driver") but it would be great if
> >> we had
> >> a way for userspace to configure these buttons similar to how we handle
> >> UCMs.
> >
> > The question why you need to change this settings in the user space. I
> > think that the device tree was designed exactly to describe this hw
> > platform specific settings. Another possibility is to use the kernel
> > module option to configure the settings from the user space. But it's
> > just an idea. You are probably looking for an interface which can be
> > used when the driver is running.
>
> I am also unclear on the ask.
> We've cleaned-up all machine drivers so that the mapping is identical,
> except for the cases where the codec inverts the buttons.
> Are you saying you do an additional remapping of those buttons in
> userpace? If yes, why not fix the machine driver? The mapping is
> typically based on measured impedance, not really something userspace
> should really know about.
This is something we were under the impression upstream did not want.
Dylan can you clarify our stance here? If we can just add the changes
to the kernel then this would be a no-op.
> Or is this a case where the ChromeOS kernel has not yet seen the
> upstream patches?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
