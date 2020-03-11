Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03D1813BE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 09:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6251666;
	Wed, 11 Mar 2020 09:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6251666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583916961;
	bh=ufo2K4oaktLM7xVaN8v8t8sz63XZ8VfQyHstW6uvA0U=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfC66tF/DBz+gbOS5UyzVm9E8vW21XwiA9MjzzmzzRIkcScm2MGzER2mi80Ak0oML
	 cwa6slqr9aNxW+3s99uGHYFPCHPlq11IxYcWhlq8tuU+R+ITIdtBlPixLenlOaPEtr
	 OK7HAQHmDDQQ7GfTcRL+USTm1Yh2UjCrzjHJ+2DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AE1F80141;
	Wed, 11 Mar 2020 09:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E40F801EB; Wed, 11 Mar 2020 09:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D005F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 09:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D005F80141
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jBx80-00046O-2n
 for alsa-devel@alsa-project.org; Wed, 11 Mar 2020 08:54:12 +0000
Received: by mail-pf1-f197.google.com with SMTP id h191so898671pfe.14
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 01:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EJWnh1S/r/UN0sDn/GSkUc/60c+WdDetrbhkwselzAg=;
 b=UFOIsoRMUuwLpU4wsza44OCFwvUndLvVU+vdVJyoqeWvQzg3uRdWIg54R6oSaV7W7F
 sE6UOyqd72zFxU5ruKsLBgFB9n7P11gB+bnWDyasKMhHFoKI6HizQ1f3srjpEwNKjCZ+
 RSEpjQxJcKBo04c9vP2jwDz4nxE6QRGY68Xh6iqm4UtoTAnpUWGYfR8Jt1C9kYo9jyBE
 sEmGekqBhM5gH29fvWeXMHpmutVhyY7L2pUvk0i2zbel/ZR/cIg+oNGvp4CJiz/ec5si
 zTkw+eNPddysA9hPBR+u8M06fjExO6UaiiUaEStBOCQsBLrvKJpewKgbLl9KRKOr6tYD
 xyow==
X-Gm-Message-State: ANhLgQ32oavvjf7UbR986vikUc6WXVyWZlU/Khnt50YbKpgOvfb0J7cv
 y3skIDC2UwCFSc746AoPxgTck7OAC2A56GT+7f4PNw9iPai/BlMzMjN+GjwJyIxwyr9wdRj4fnG
 B/ga4CEMOKLY01gDvipbKmHIyRPvnfAZ6HNrsCsXd
X-Received: by 2002:a65:494f:: with SMTP id q15mr1837947pgs.383.1583916850398; 
 Wed, 11 Mar 2020 01:54:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtm8So4/d3DEnR6dWVHPhIUH8t8Knc+iRilA2DGZRDO/zn7T+RrQ/v03vMqgAyTeD7rAD0jqw==
X-Received: by 2002:a65:494f:: with SMTP id q15mr1837929pgs.383.1583916850047; 
 Wed, 11 Mar 2020 01:54:10 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id a24sm929062pfl.115.2020.03.11.01.54.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 01:54:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] ALSA: hda/realtek: Fix pop noise on ALC225
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5ho8t39yaz.wl-tiwai@suse.de>
Date: Wed, 11 Mar 2020 16:54:07 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <65C45FA9-E58A-4EF2-AE42-5CF2AEF00F68@canonical.com>
References: <20200311061328.17614-1-kai.heng.feng@canonical.com>
 <s5ho8t39yaz.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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



> On Mar 11, 2020, at 14:54, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 11 Mar 2020 07:13:28 +0100,
> Kai-Heng Feng wrote:
>>=20
>> Commit 317d9313925c ("ALSA: hda/realtek - Set default power save node =
to
>> 0") makes the ALC225 have pop noise on S3 resume and cold boot.
>>=20
>> So partially revert this commit for ALC225 to fix the regression.
>>=20
>> Fixes: 317d9313925c ("ALSA: hda/realtek - Set default power save node =
to 0")
>> BugLink: https://bugs.launchpad.net/bugs/1866357
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>=20
> Hrm, it's rather surprising.  The power_save_node was thought to be a
> cause of the pop noise, but in this case it fixes.  It's interesting
> because this codec chip has no loopback mixer, and the connection is
> directly from DAC to pin, so in theory, it shouldn't be influenced
> from other nodes.
>=20
> Anyways, a slight concern is that this might cause a regression on
> another machine.  But who knows, maybe the influence is very limited.
> Let's apply it and see what happens.

If that happens I'll write a specific fixup for the affected model.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi

