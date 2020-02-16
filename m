Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C211601A8
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2020 05:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B055B1674;
	Sun, 16 Feb 2020 05:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B055B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581827629;
	bh=DZdBV/TB9Iu603DGV7sVDb3Hofk4qJSe/36P4kj++4k=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N68W/T04/6pkj9IgA1sHoBhB9clzMV6OfBcBhaItsdZphOja3q27STJ3rgPHOvyBW
	 2kdZIHD6GG+oPNmjD5Zh7Piso0/5dlpQMuMiDdeqJ1ZaIhofgBO/zD5q4IlM7d3thk
	 2CZLAKQziFRxovWDJe7wXKEJPNkpJbnV3+1xC68E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9664BF80145;
	Sun, 16 Feb 2020 05:32:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C7B2F80145; Sun, 16 Feb 2020 05:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F842F800B6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 05:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F842F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dxKZyJD+"
Received: by mail-lj1-x22e.google.com with SMTP id o15so15042825ljg.6
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 20:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sjkKaGdqiTKd6hVA0UThcAqMC1X8CMxThsoQ1IImQv8=;
 b=dxKZyJD+uso9Y/HHAv6iZUjaSx3Ep+5A3P0OcdpUK/M68TFpOx56Dtfzk0ZIHKNunL
 Wa0ATm0XV/cXyjhve8Cm6ecnkBqbUWK5gOmv9i07mMaIppd8wErHowgsd/3QLOICWaAX
 ZZDCxYdHuoiAm+ieX0v32YxAxUx4Wsrvk/m8MddC/l3YTbrjeIGbEdG7upLG2Abd7Ueg
 jREZdyrJZ1HT4jyYLdUtdwqAmDnBcE0SbP2qehtRQR7iz5c+FNTbn7rU0hoHaJeVXU4S
 B6Bxa0F4nhIJz/PiZYWdJU1G9HK7u+GQ83jV2gEn4F44UFmc6yGjk/KxaBlltb8RMGaw
 v8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sjkKaGdqiTKd6hVA0UThcAqMC1X8CMxThsoQ1IImQv8=;
 b=RASF9b5+bbruhZQ2TvSTtpT9KAq1Ag7HfcTkY+apGe2Uml3q8opoOs9AZX1iyNki98
 aHJaCnRV5F8ed+/WTMg7vgkdqV0IlKhpg/4XiSC6bS6TdrA/EFIMVr4SwjMNmlnOKP9a
 OJXaOUiOmLVe8WUvAe3MsH7hrUXKRssuJOZkg6ozsiGp7NBCX8FFiBvjdguRPm/i60GJ
 M/pJef8b0nTrd4y+Au3ohp+4t/pcLW/YbA4evob006G7PrHpDFhaROB4lPRvEI+5p4op
 DjrJ/J2swLjeMJqFN+XCcWPfZn5lgWr1bJaKwnYYyifm5A01lpackvKI/BH3xJf5VAkH
 7jnw==
X-Gm-Message-State: APjAAAXbzcwyD4CYXFaLXj8gLhi4roSOAz5GKiJnqv80L9Htoa9rjRHq
 vT6WQaCuQiGWqrIF7dqa1fdC7Edu5snTo1RQesLaDamPUKs=
X-Google-Smtp-Source: APXvYqwJxBXXTgb+KLW7ffIW+ACSP/p9AmOHfDad0CJk50py3cQYftSZmh8maFdZGh1UUc5+A2MGPg1m7CcleclAmBA=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr6538611ljj.191.1581827519905; 
 Sat, 15 Feb 2020 20:31:59 -0800 (PST)
MIME-Version: 1.0
From: Manusha Wijekoon <manusha1980@gmail.com>
Date: Sun, 16 Feb 2020 10:01:49 +0530
Message-ID: <CAErR_7kPcWDgz=z3RvOHzQEaf9bzQAw2JG51Lie7jjeDRurVyw@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Best way to interface with equalizer
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

Hello

I want to control ALSA equalizer from a mobile phone GUI. Essentially I
would like to build a small GUI that runs on a phone to allow a user to
change equalizer visually. I want this to be very smooth and stable.
Few options that I can think of are:
1. Have an agent program running in the linux machine which controls alsa
by sending various commands through linux shell.
2. Agent program running in the linux machine directly interfaces to ALSA
through its C interface.
3. Is there a control interface provided by ALSA, for example REST like
service?

3 seem to be the best option as it involves less work. 1 looks fragile to
me. What are your recommendations?

Thank you
S
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
