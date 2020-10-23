Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E936B296FBC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 14:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889B017EB;
	Fri, 23 Oct 2020 14:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889B017EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603457695;
	bh=dqjk4EOKkFoUvrCdP/IosX3JjLhDbU6x3HIqrKF0Dlw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmcQpUkiLYMjsjwZNjQtxRUD2mtVDrY3XmWFecSCRU+xuKA+0+qahZenCQTp0jrYn
	 5VhXQWH5LswEuKDaJYXACah7Q/B/uYH6UeLWsm0T/9TO28H7wJRshxj0jTR4CJjrOc
	 Gvz1ofs6wNeDDTilYLX3SFBMDkbJhplxjodmkr6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D86FCF80264;
	Fri, 23 Oct 2020 14:53:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1B12F8025A; Fri, 23 Oct 2020 14:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47659F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 14:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47659F800BD
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kVwZG-0003FK-NJ
 for alsa-devel@alsa-project.org; Fri, 23 Oct 2020 12:53:14 +0000
Received: by mail-pl1-f200.google.com with SMTP id 97so1184979plb.4
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 05:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eQD5RdIj2axOzAgoVfN+eJW9uUKoyO8pNPOdpJJuNKI=;
 b=fOCfsNyUnOhDgTIxQBb2Id9L+yijdyCCnPVBCqR/JFOC8MFtgrVgwJlzWZEyvJFlnO
 y7sD1HcWh1tFaML5NkK/6lKErrVFUfPCD76CwF8BdIsn5Lxj9II6e9jhz4TqrSXTY3Mc
 jL3Yl9VTsdnpSah/cKLMxDRwOSXETPXAKwzDXqftvimZXNaGwO7dtqEl96doOUqStBzC
 Pr9SK55b6slU3wL/Jo5U8rAGB5pEYShRo6ke5seWX3wCalbxxnKLxbTxGd7XWOKlMV9C
 cwsAkhUDUQzdoVR3lKjsd6OLJdtfCpzUXRCVZITaZtVOygGV69R+NOKYfIq/XHSDg+uY
 QY4g==
X-Gm-Message-State: AOAM530/Qnlv7G3sgAgqJ10s7mia7swb9Vzwo8nMdNps3AyMCoMtxiA7
 uZKD07y3VMov7TyJ78Xw/d7sscHjD+2WX1QmRsr29OjILgxIg1Dr9HCuGTafhTLzZJ/eN3GEvZu
 ZQTYjvPh8lRn9jmIEzGylgKdfYNidjh5mkc3C167b
X-Received: by 2002:a63:2d87:: with SMTP id t129mr1974775pgt.206.1603457593340; 
 Fri, 23 Oct 2020 05:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI8syoCoaAVfWjq6dOj4WJZk2nF7k2P6xmGzSO6nyVBO3DgpxHg96Dl4Num9hvY5LtX2lw5w==
X-Received: by 2002:a63:2d87:: with SMTP id t129mr1974749pgt.206.1603457592863; 
 Fri, 23 Oct 2020 05:53:12 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id ls8sm2336497pjb.54.2020.10.23.05.53.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 05:53:12 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 2/4] ALSA: hda: Stop mangling PCI MSI
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5himb189by.wl-tiwai@suse.de>
Date: Fri, 23 Oct 2020 20:53:08 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <6562A60B-C27C-4912-94AE-6A23839DABF4@canonical.com>
References: <20201023102340.25494-1-kai.heng.feng@canonical.com>
 <20201023102340.25494-2-kai.heng.feng@canonical.com>
 <s5himb189by.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Alex Deucher <alexander.deucher@amd.com>
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



> On Oct 23, 2020, at 19:34, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Fri, 23 Oct 2020 12:23:36 +0200,
> Kai-Heng Feng wrote:
>>=20
>> @@ -1038,14 +1036,6 @@ static int azx_suspend(struct device *dev)
>> 		__azx_runtime_suspend(chip);
>> 	else
>> 		pm_runtime_force_suspend(dev);
>> -	if (bus->irq >=3D 0) {
>> -		free_irq(bus->irq, chip);
>> -		bus->irq =3D -1;
>> -		chip->card->sync_irq =3D -1;
>> -	}
>=20
> This release of irq has nothing to do with MSI.  There has been PCI
> controllers that assign to a different IRQ line after the resume.

Can this issue happened before commit 41017f0cac925 ("[PATCH] PCI: =
MSI(X) save/restore for suspend/resume") was merged?

Kai-Heng

>=20
>> -	if (azx_acquire_irq(chip, 1) < 0)
>> -		return -EIO;
>=20
> Ditto.
>=20
>=20
> thanks,
>=20
> Takashi

