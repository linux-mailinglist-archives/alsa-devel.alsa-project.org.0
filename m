Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB8450143
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 10:25:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EBBF1680;
	Mon, 15 Nov 2021 10:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EBBF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636968319;
	bh=Mb61xVvHvORiZ21gQaqErt+uKNv56g/87uVRXpuBl5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8LY1uHASk9kso+xgbBvmiNlSD4V4jiJNx8PULjNFwkr6VlL/gaqccpYeKEp6z2tE
	 JdUK4dI9w7NiYxp71uvvLDPrvmUFSiErmZspkjYIR2+evv+cWQt1GaE9cpwAqJFQVC
	 Kzw7bhBbAea/NzIWrZAGvWPYTkQVDpaY62/s15TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADDD5F801D5;
	Mon, 15 Nov 2021 10:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BEAAF8027D; Mon, 15 Nov 2021 10:24:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B4A7F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4A7F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qH5KE0sn"
Received: by mail-ed1-x536.google.com with SMTP id m20so22994347edc.5
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbmvuWuUSfKdOlcmo0uJWBzKXpnV5tuek3P3SiCibEk=;
 b=qH5KE0snafhjbS/voRXo89nk5nrynpnfHsScbND8YfY+4LpSjDfzvKrSBiqNleQcQa
 wypY8y7Z6V1kE+X0NgWL8b3PoAFyYGIqMeFTmSscfoC2lRMMuYltvwrlNHH2jCnLtOVI
 8KRQWQRKVgmQbJguR5AAWW4e0WKvgouyf2IOrniMp2xrLSUZ+d/BdII60NNatnH90cgN
 EViNsONS+tfQ2CrmURPYYawV7f3H2hm2IYBcK507/yZdfD6anpFzx3XfWkN6WDCdNEsY
 0KCpcYLRnM9kipDXdp4liru6G+LNgMxKjdJhwxG0MGDjdICnjuujtIMSwZpiwlqmRYKM
 J76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbmvuWuUSfKdOlcmo0uJWBzKXpnV5tuek3P3SiCibEk=;
 b=Mw8qUI1bLqwlmAXYTLLzf5XZvVuBMgpf2IUys3vtO+Z7m6xkpW+N8W6fAVFRD2rgjh
 um6bY34O0wIEW2o01ey6XfiH4ZL5zh8uTO6F2r8iGakqeWM0exCZAhh+JdjQmzVSGVoC
 hAWYgJtO0Z94w70HY8N9E7L0KHNKJG7vsNznVT3K5wQwmnclua6LD0nRlleXy2V1DDbG
 qX3RFoGEzScueASAYrYQeZCavwZXz06Z443jn07Xc1pB9ivx07dpoQEPz3PQHWYSiJZr
 tJoEEC1+Ibfku0ERBFFdeH0+8vp54m4/BeXsj+4xNFECxBPJkMxiSU9offkJOzDTrENM
 OzHA==
X-Gm-Message-State: AOAM532tx5v563WO3hoWJzWA4r8WeIAiEhe9/JRmbxDlepXjh11rIyKZ
 ejDR+NhnPp++Z4UfbLHL7ITW1wPrJf3nahGoj/K36THrxZw=
X-Google-Smtp-Source: ABdhPJz1omGyxErzYj3MuC6KuufPos03iShfJ7h531qC4NJ8/kcVjpuToeCtcOStkXvZffBP7GEKI7wEAMj+gQNoh/A=
X-Received: by 2002:a17:906:58c1:: with SMTP id
 e1mr46998368ejs.327.1636968235833; 
 Mon, 15 Nov 2021 01:23:55 -0800 (PST)
MIME-Version: 1.0
References: <CAOsVg8oASKrYST0CR_C5GAd4wcBjKcZkbBSrVdV51oPBTHqqdQ@mail.gmail.com>
 <f5f068ac-42dd-a496-b496-a4359114c634@perex.cz>
 <CAOsVg8o25hDrSTFJraA7vCoA7hCz3MNq7RM7p=-D4si=VaYEXg@mail.gmail.com>
In-Reply-To: <CAOsVg8o25hDrSTFJraA7vCoA7hCz3MNq7RM7p=-D4si=VaYEXg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Mon, 15 Nov 2021 03:23:44 -0600
Message-ID: <CAOsVg8oX9mWVS9QSi37wQOV4vQ94eAVdfrBxgXUwMfjv=47JHQ@mail.gmail.com>
Subject: Re: Token to create an account on the wiki
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Sorry to bother you again, but I'm assuming the code to prevent spam
while editing is the same.  If so, I'm getting this error if I try
adding and updating links:

A database query syntax error has occurred. This may indicate a bug in
the software. The last attempted database query was:

   (SQL query hidden)

from within function "WikiPage::pageData". Database returned error
"1205: Lock wait timeout exceeded; try restarting transaction
(localhost)".

Thanks,

  Lucas
