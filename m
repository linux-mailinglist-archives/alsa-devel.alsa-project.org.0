Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78D17CBEF
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Mar 2020 05:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EDD1660;
	Sat,  7 Mar 2020 05:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EDD1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583555823;
	bh=M4RqAVMIUZtw6jW6L9b/NNM3dIE5gpEkYjJUh43SPhc=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zwm9PbyPWQC8xfNbwF3+Vn+lrxlCQfkV9NNe121gR4W+sboRZsbHMK1b7cRkuvRyI
	 tvGurHDr3kpd7Gk5Jtum4eQyHFww93QsJnvyEPKiR8fEtD/G6QDRCnSCkKHxDkEnsE
	 P0ovjjPwoUv534hqGpoOyTvUAuMD/9kInN7oARAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9A3F80266;
	Sat,  7 Mar 2020 05:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D61DCF8025F; Sat,  7 Mar 2020 05:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EBEF80130
 for <alsa-devel@alsa-project.org>; Sat,  7 Mar 2020 05:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EBEF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lb8heO4i"
Received: by mail-io1-xd32.google.com with SMTP id h131so3450312iof.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 20:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mp2jKw3BR2/WUzUo3CX2KZa7SdT2B/WVfjE292+5pEI=;
 b=lb8heO4iCDu+zizq2CvdiCrjf4BSmmo1thSm6Za9ZRv4r3LVD5Mln4eKVjDwxjrfe8
 uJk8TtyjYroAF9us66tdpoMGn8D5n8LkoDwouxxDX5lHRWrx7vW4qNWhOH5Zwx2GsPMO
 pZH9+AjkDP01SGaTrLNQPksuHl6AX5KNVhS2foiZdj9RJkGGvmV531ZltsvKkverGeQm
 SI7MZz0HLRAOPOc1uFVE2XoTXMZaSfE3Fo3OkkTUrDJFU4Sx2uFp8szs9RUkRCEZiZWN
 IysPV8JJD/IN/wLxHwkCraFi9TLLIUL0ackfjSQBDksvJeoW2u4uOarThvL373h+kXqn
 yAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mp2jKw3BR2/WUzUo3CX2KZa7SdT2B/WVfjE292+5pEI=;
 b=inr2e83X8IGamoHsRhbJqAMNYlRXPGdz3LEawBwHZ8a/HIz7y+Hfzz354JXXSNwRCe
 wB2tayGS5hugSQMXHJCLRUgzWbKBwgdmPbHAy7hnWuPoPhvHTVMW8pkRitqp4AcpnTN6
 lgwoxDnqVMHGl6US+2cSWUorgoUOSdNTXxSSqu2k1+JRjF+6KmWsUxAnA4nU1A02T/1J
 maOIGo3hJgSHsSc85KUE68V6qO6aYYKdccxb85EOoHEApo+8m6C9f9m8METCVG9lt5XD
 5dUfVzWK75zINZPoGaASfgHeKSkMOtZdoarTo4cebWHZ0bKjxEuzXh/zSuTLtNb87RhC
 iUJQ==
X-Gm-Message-State: ANhLgQ1gC79AXbkY2Tbv1rSpNsPZUNgwh7qAyIDc9c2BdiPO6bJnL5MU
 FZe0PKh3faPRUQs7v2O0jvwzlx7rH9vODowTz6Q=
X-Google-Smtp-Source: ADFU+vsxBha5M/TbNCB9bmijOCNnIjSxAlWyRoQMc6D4z1rjraYeKi4ttG6/EI6xRupI0/uQh0K4sTU0D6CGmDIt1jY=
X-Received: by 2002:a5d:9658:: with SMTP id d24mr5620931ios.173.1583555696206; 
 Fri, 06 Mar 2020 20:34:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:4c0f:0:0:0:0:0 with HTTP;
 Fri, 6 Mar 2020 20:34:55 -0800 (PST)
In-Reply-To: <CAOzgRdZZQLKYOQDxvySaum5CTD8Se=UVac=ha9R=+vF_md+4Xg@mail.gmail.com>
References: <20200106131159.476744-1-hdegoede@redhat.com>
 <9f6ffcbe-10fe-91fa-3998-029c2837a39d@perex.cz>
 <CAOzgRdZZQLKYOQDxvySaum5CTD8Se=UVac=ha9R=+vF_md+4Xg@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Sat, 7 Mar 2020 12:34:55 +0800
Message-ID: <CAOzgRdbmwdc7Um=7HAZ+ksUvn0e8Ex1i3hgVrbH8SeLZzwyU3g@mail.gmail.com>
Subject: Re: sudo alsaucm -c bytcht-cx2072x set _enadev Speaker
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

HP Pavillon X2 10-n105nf, a user report "alsaucm: error failed to set
_enadev=Speaker: No such file or directory"

on my ezpad es8316, alsaucm -c bytcht-es8316 set _verb HiFi set
_enadev Speaker, "set _enadev=Speaker: No such file or directory",
only can _enadev MonoSpeaker.

2020-03-07 12:25 GMT+08:00, youling 257 <youling257@gmail.com>:
> sudo alsaucm -c bytcht-cx2072x set _enadev Speaker
>
>        alsaucm: error failed to set _enadev=Speaker: No such file or
> directory
>
