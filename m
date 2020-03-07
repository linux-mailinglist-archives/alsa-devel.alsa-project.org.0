Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021217CBE4
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Mar 2020 05:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1421660;
	Sat,  7 Mar 2020 05:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1421660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583555212;
	bh=A+EdBak+uiCMTKs8DPDV5J9DaAG6NP52fOVNHw76750=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFecS4kzdNI3mYYn5qWlKHWcUAyJDwGar3zP2/fAZKpwNtNZC24hIezhedPKflkZi
	 BDmjVa/sp9FF1RDbwMcfP7dHJJnXksIlZ9feJq+vvUNk0RSUrZWSTqv0Kv4h5RJCOG
	 N/Uvr3gL9EdKEQLYPcUGvh4PAFmt9QlzbPf5Bklo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D832F8012D;
	Sat,  7 Mar 2020 05:25:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C54F8025F; Sat,  7 Mar 2020 05:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33EF7F80130
 for <alsa-devel@alsa-project.org>; Sat,  7 Mar 2020 05:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33EF7F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XN9TzsKj"
Received: by mail-il1-x12d.google.com with SMTP id t4so423920ilo.8
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 20:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/B90CqercAEcYrvvEoOddntUvXrGF8qFwsFSiNeCla0=;
 b=XN9TzsKjE7h7rCmPCGwadZJoBlTdBUPDvNu2xgxTQPaZ8XZtaXmLVjJ5IT9XmY9lqw
 WvdLwrERvtEm8rDO88/dxD7fKe9bvabaeWlFpI+1Ec9yzuSLyE3Zh4Uh1vGDuKcP8VBQ
 I3CZNcbuZPh2CUaOghOHlvzydTaBbxwTsMma5oYtz/shwCFShbXaHz/t9n8Q5uMbodhu
 UtozmCbiX9/M88oecpZQ842Kf1i7ghRCfmGOYNhTtHcSHzNITP+6tyFEx9ghvPmDiYjO
 lpdMzc52KEubcB++sIYLR6vqIo8sa+CcT/Funb4q3ssPcozgcT1h2VNBphv+a44pRJw4
 rwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/B90CqercAEcYrvvEoOddntUvXrGF8qFwsFSiNeCla0=;
 b=VPQcrYf4gDA6Y+2HSco5S48jrsEi581vYFo9GXrOKwwGTf7mjvbn9LPLkG0fZ5phCH
 fQl/nA0xkalZvvT/+ns7iC2qf92Cr/FU65pezMh1Y9eDrLWOlBCp4dgFvoLP9RZ041qr
 L+MkEtXZQJVTmvf9PSnbFbQiJRTvcE8A1d/m8Sk1v75jBMpUO4pBj4qBbNmiogIML+1J
 6ZUHKHsGk+6tfBfjbZ++BRusxjPsB+xmZSoHYPsgyU4a7QX0kE2RS3FiOjbI11IzIsjR
 1SNmChxYTtzQKMxb9AXkdCA+/Pi9tYkpcKpdiFN760+yB70VkA6dd6mLjKMuxA+p9MFQ
 d24A==
X-Gm-Message-State: ANhLgQ3WK4FSS8sS7vU71/jn+WT06PjbkACXNgDAU2kbxw3KCypyR2rS
 60v0JBSF67Ar51MlWWHuV8hmBcW7Pr9x8/Mg1Zc=
X-Google-Smtp-Source: ADFU+vvuhS7Tlz8mN3ypyJjbXL7HzD1K5WwoKyHvozZ4mbHYnbJ9NzLuNomM/rmvdn6BDK1MubaFMo6ftIPFXQqT2ZY=
X-Received: by 2002:a92:860a:: with SMTP id g10mr6119229ild.280.1583555102844; 
 Fri, 06 Mar 2020 20:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20200106131159.476744-1-hdegoede@redhat.com>
 <9f6ffcbe-10fe-91fa-3998-029c2837a39d@perex.cz>
In-Reply-To: <9f6ffcbe-10fe-91fa-3998-029c2837a39d@perex.cz>
From: youling 257 <youling257@gmail.com>
Date: Sat, 7 Mar 2020 12:25:06 +0800
Message-ID: <CAOzgRdZZQLKYOQDxvySaum5CTD8Se=UVac=ha9R=+vF_md+4Xg@mail.gmail.com>
Subject: sudo alsaucm -c bytcht-cx2072x set _enadev Speaker
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

sudo alsaucm -c bytcht-cx2072x set _enadev Speaker

       alsaucm: error failed to set _enadev=Speaker: No such file or
directory
