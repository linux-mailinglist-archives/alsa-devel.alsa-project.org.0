Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA929A689
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 09:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6496816A8;
	Tue, 27 Oct 2020 09:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6496816A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603787180;
	bh=nsFIaYPyP6LBazwYe3a7GxGyzCjJ8fwQxAoGUh6C6hw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhfD0fw6ZKRT7VM2+2TG3l42EJgYLkQyz4MOozUyviqu62RVrCwshUbAZHCJ9BiZI
	 z9rGP1d81EHjUoPyzyaJ867yVW041mmmN6B1fx1dHivdEHY1nyti5MSBpJfx4UzOCg
	 Gm15VpjC+iQt6OX0R9uIpjws8Wu+azNRk2X3LTuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79DDFF80217;
	Tue, 27 Oct 2020 09:24:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60729F8020D; Tue, 27 Oct 2020 09:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1AB9F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 09:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1AB9F80086
Received: from mail-pj1-f71.google.com ([209.85.216.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kXKHV-00052T-U2
 for alsa-devel@alsa-project.org; Tue, 27 Oct 2020 08:24:38 +0000
Received: by mail-pj1-f71.google.com with SMTP id d8so378884pje.6
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SFlJSj1q7ASCYrGYYql1T2iPE3cfJ9xUSF5ewwsu+fw=;
 b=RP0eMevXyz9iSP6ZHFYtJUjbxBWKE60sb+plYNIvj3SQH62WIgW4HThjB1ykeNAxNd
 MPNNJdMHQVdycRt3UtJp0hfKboLYCuI+2Q99Hi/C7NPk9gxbrH+JQiBXAPee2o1YSfx6
 sk28EgrTz9XOIjJ5IXYqqVqfaGHP1IV3LaLBwbIZrq31pSiA1Tu2sA/7+I9Lf8dn8lZi
 /AIEs0hqg4mlnWaURM1kqD0R/UUSQJaBXp0wMsTc726C42SILYm40nuD7XhlY1KXVIhx
 1ynHtiKFLSDXpmboj9V/k5c0ih786ol8ANzRcQt2JYS59XbhQtssyesGXN5yiv+qnT7t
 NjYA==
X-Gm-Message-State: AOAM5304j+FePiLkz7Ebp+Ouw8PUyMjQy3N83zhBddvFTTfUoXvxg2Fg
 B5/bwWuNzYaCjccQJ7n+swc1WPBvl4qcb7eV/uUIDWjmUvmA88/aoNeMiBHk43AbFxAy5leHGb6
 BTgjHrw4pzjZ5VXwQdiGszSr1pzbsdM3L1T02yLSP
X-Received: by 2002:a63:2b53:: with SMTP id r80mr937290pgr.439.1603787076321; 
 Tue, 27 Oct 2020 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDWJ42nV2998HOqGb8LW3xxFBVpSepmFlAkoLUdN6qQWEtwNtB3zUkFHd+97bs19ZDzFpqTA==
X-Received: by 2002:a63:2b53:: with SMTP id r80mr937273pgr.439.1603787075958; 
 Tue, 27 Oct 2020 01:24:35 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id a18sm1042842pgw.50.2020.10.27.01.24.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 01:24:35 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v2 3/4] ALSA: hda: Separate runtime and system suspend
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hft602ifo.wl-tiwai@suse.de>
Date: Tue, 27 Oct 2020 16:24:32 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <585925F6-8262-41BB-A21D-EBCE6EBF9B5D@canonical.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
 <20201027054001.1800-4-kai.heng.feng@canonical.com>
 <s5hlffs2jsy.wl-tiwai@suse.de> <s5himaw2ilk.wl-tiwai@suse.de>
 <s5hft602ifo.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, hui.wang@canonical.com
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



> On Oct 27, 2020, at 16:15, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Tue, 27 Oct 2020 09:12:07 +0100,
> Takashi Iwai wrote:
>>=20
>> On Tue, 27 Oct 2020 08:46:05 +0100,
>> Takashi Iwai wrote:
>>>> @@ -1103,10 +1115,8 @@ static int azx_runtime_suspend(struct device =
*dev)
>>>> 	chip =3D card->private_data;
>>>>=20
>>>> 	/* enable controller wake up event */
>>>> -	if (snd_power_get_state(card) =3D=3D SNDRV_CTL_POWER_D0) {
>>>> -		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>>>> -			   STATESTS_INT_MASK);
>>>> -	}
>>>> +	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>>>> +		   STATESTS_INT_MASK);
>>>=20
>>> ... here we should have the check of chip->prepared, and set WAKEEN
>>> only when it's false.  Otherwise WAKEEN is set up for the system
>>> suspend, and it might lead to spurious wakeups.  (IOW, checking the
>>> flag at resume doesn't help for preventing the spurious wakeup :)
>>=20
>> Scratch my comment above; it's the code path only for the runtime
>> suspend in your new code, then this cleanup makes sense.
>=20
> Also, as one more cleanup: from_rt in __azx_runtime_resume() can be
> replaced with !chip->prepared flag, so the extra argument can be
> dropped.

Ok, will send v3 to address it.

Kai-Heng

>=20
>=20
> Takashi

