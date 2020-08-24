Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AE24F3FE
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 10:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B4D1673;
	Mon, 24 Aug 2020 10:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B4D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598257648;
	bh=OLfldAL9VUjeIC9Ywgu+hoiSmT0rc7nMwXpADFevEtY=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R8OArHsA/WEwmyCGg2yslJVTfayboIbwI5fF/eBMFibkuARKkdYjb5szaHF9gws9e
	 VlahSc6OLkTQk7JhoGe+ZieoO8g3HcIvsNY4WILTu+Ubw+i+fTBgWf5n1t3TeNQRw7
	 3NYwlVDt1N8SaxfOzzUuhueuat7jHmhCqDuEYp0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32964F8016F;
	Mon, 24 Aug 2020 10:25:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57E4F801D9; Mon, 24 Aug 2020 10:25:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77766F8013D
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 10:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77766F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r2k1aUG/"
Received: by mail-lf1-x12d.google.com with SMTP id 145so1141010lfi.8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XVar8OnwfwB1TY87+/LSOHek4rlWMDoo5c+yWk2RNY4=;
 b=r2k1aUG/tv+fnyPTNpIGYy2Cc5GZtD0pUA66AjrBeTDu7rUD55xsxhwjpP8RHEmm9t
 kBOzH1BrdaWJ1iFcZXkImDXwaXPEyKE2XJvftKgLcwub0BpzFJb9uKmkARNDa9UkbCVw
 2/ajfWPNXQLPbyDs5KKUEkow95/0CrDuXNyBdXpfRi3sZWIYTOjPZpJOODzU8waT9bIH
 WN1Zdu7QIZipsmdWZlJpQFNsn3h4JcsA18ZlAAguIAIz+xr+OghmF0+fDctvz304jGls
 ielDsUddo32gzXyAXSUgT8FmX5a3aY7FQeuUIyaXgAemKrAxdMZ/AgCtnPvF1EcQHILw
 cvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XVar8OnwfwB1TY87+/LSOHek4rlWMDoo5c+yWk2RNY4=;
 b=oy2fybzRx8etEvRRMM4LCK8A3b2pK6BfcVKA05wfTDjIP5pWdwNaq5HRbV0ZkAfOEN
 ivqeXscw/w0J+ZZnZomAtxG8KqJzhdY42a9NEqetyPRMnhkc76eDBge/D9mAE0P8QxiK
 PgaVC8CBOqcAR9Lko+Jhk1qmfJtnvqCNvhPwShhA3hlXWBELOhB9n+cyoTX22zxKCERS
 si/gkJ4ac+DSD1fSgw7AY5fh0EV4gQmuscHfU+3KhiYZY14RKm4JMy1JcACjeJtHPeYa
 PpyxJ54BskwKD6ykG3PCA0QijsrEvR8TQKbI3oksAM/92yLqQ6XOFEgQl17mPhC+cHg8
 PVxQ==
X-Gm-Message-State: AOAM533tBfI9X+av+P+2iXhT2TH9egd+Xd+g2MfKxi4zK0sP3HSR+EwV
 2zVa6+Vz+twQ4XplYM5VXXYI7hZOw22eGPK2KKp38iQLO4OCWg==
X-Google-Smtp-Source: ABdhPJyRzkmzuL/h+URSoXt5HW/DXCJWXq36IsZnQtuNkSunli5Eo16+26j9CpFQ7lCR/oMqnfuHW++pPSjga9MTbag=
X-Received: by 2002:a19:be0e:: with SMTP id o14mr2185892lff.203.1598257524019; 
 Mon, 24 Aug 2020 01:25:24 -0700 (PDT)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 24 Aug 2020 09:25:13 +0100
Message-ID: <CABPh3UOJXzvFWEoK7XkuV+37=TmHiQ_R7H_nvSCdzbu0WNcTfg@mail.gmail.com>
Subject: Help with EDIROL UA-101 midi not recognized on kernel / UA101
 improvements
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, 
 Clemens Ladisch <clemens@ladisch.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi alsa-devel,

I have an old edirol interface (ua-101) that is still kicking (8 channel
I/O in a small package)

The problem is that recently (I don't know from what kernel) the midi is
not recognized anymore.
Also I would like to implement an application to control the internal mixer.

Can someone help me out/point me in the right direction where to start?Or
help me with this?
I never debugged an USB driver before.

Thank you
Nicola Lunghi
