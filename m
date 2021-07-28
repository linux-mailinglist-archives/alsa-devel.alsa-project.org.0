Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 861853D8846
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 08:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203FB17C6;
	Wed, 28 Jul 2021 08:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203FB17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627455182;
	bh=15Kv8z4HkMavKpIRmHmEpq2L6YjnTSlt36+bRnQDLck=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jfbT/z+w66NdVq018aVPShoDWKi51e7PJEvBO2vDAgJuD2MrH7Uk5BHKfsOZGPrIv
	 k+AKFucjcbIOBHIp45b9RXNT9bz1xBK12lf3O2iIY99RQbUoogWnXU1bn77hAQh7Ri
	 4tm8pH6p85i/zJiHODjNmOAtyJLA97bOUbw1b09g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF55F8020D;
	Wed, 28 Jul 2021 08:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1AEFF8025A; Wed, 28 Jul 2021 08:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CBD3F80127
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 08:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBD3F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IBtovHZP"
Received: by mail-wr1-x42f.google.com with SMTP id h14so1141482wrx.10
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BxlUZ67YEucKrtOdvCbWpWe0X/5mgBESCEFbksyUeJI=;
 b=IBtovHZP/nmImSYnT13flCcC/DwMIhdbenLvagtteX7EesR5+POw0ydt7ntZsRWi+Z
 6+DULfjXQomsDF5EhIml5zpFAyKvHQ99lYFgh8eBd46Nec2VrC6Lfstk39zkesw4O7JS
 VPhBbjNvL9mSWlGk2lXeV8c+KrqtOhZuEQ+AJAlkPop9kfqVlxKf/oZjgq/VocnwXt0C
 pEek0osCM4WzvmhGovZjOfJ03SagWyaMRBbzTl5IBOy3pVT05sI3hCTaXNrZhzfGCy+t
 7IA0E/MYTJi2xCb4EPKtxS7B2Ftubn3QDG8sfk+WMzDclj1Wc17ha3nblnQol1Wwqzc8
 BSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BxlUZ67YEucKrtOdvCbWpWe0X/5mgBESCEFbksyUeJI=;
 b=gnlNDBBGRYJbjc1mJVw247W14fqakb5x8+xPq8a9JD2EZC9V8C/4+ajdM8dHL8FB1U
 IvARswVRdAm2HDs2/WWBGvP9y00k7H/kWp7v2USmm9e9JA6e9WLEoAlN7q+9zCTLseH2
 oUJBJskVhyBIShG6r1gTdcvf81aMYBHeDtz663dECxkj4JDSta92Y0LASnGjts/U0p5Q
 y+KqvvmKdC+NgIDyrm4qRdnJBWz3Uv5+6GbKFrr7zEyfaU5dUoTNDJByZSZA095j+VGd
 3YdYUrS54j8INR/emx/uz+z4f2utzIXUEDdSXxjwk7on9ri+Hpo6bkSJh7s4I5ZS1Zrh
 A2xg==
X-Gm-Message-State: AOAM530vXVmG2jMegk7IKKEK0BdBjING2IimJXbRdvc1OMcLgpcnI8r+
 O+gCVnrso77KUDhzRfoMD208cmTEYsA7Yc3Saxs2UPFJ
X-Google-Smtp-Source: ABdhPJwAMRehutGcCsEMJbIjAmRxQfhGDgWUGbaPCPEnAwRBdkEHV9eMo2HkeiNlcS0iCcMnQllHnPbMYrPR9XfjEAg=
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr27565639wrp.89.1627455085980; 
 Tue, 27 Jul 2021 23:51:25 -0700 (PDT)
MIME-Version: 1.0
From: Anton Nikolaev <anikol.159@gmail.com>
Date: Wed, 28 Jul 2021 09:51:14 +0300
Message-ID: <CAGh7KHRZcy0G=GFKvBZCXucbxozVk1ytX0jYCEch6gDYs4FLew@mail.gmail.com>
Subject: Copy hw out to loop problem when recording started before playing
To: alsa-devel@alsa-project.org
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

Hello everyone. Please help. Do not understand what is wrong

Chains is :
Plug asym1 -
  Out= Plug with multi (Copy hardware dmix output to dmix loopout)
  IN= Dsnoop with hardware dev

Plug asym2 -
  Out= plug dmix loop
  IN= plug dsnoop loop

Work good if playing to plug asym1 started before recording from asym2.
Not working play to asym1 if recording from asym2 started before playing to
asym1.

/Etc/asound.conf is:

pcm.hwcard0 { type hw; card 0; device 0; }

pcm.!default {
  type plug;
  slave.pcm { type asym; playback.pcm "devhwcopy"; capture.pcm "devhwin"; }
}

pcm.devhwcopy {
  type plug;
  route_policy "duplicate";
  slave.pcm {
    type multi; slaves {
      a { channels 2; pcm "devhwout"; }
      b { channels 2; pcm "devloopout"; }
    }
    bindings { 0 { slave a channel 0 } 1 { slave a channel 1 } 2 { slave b
channel 0 } 3 { slave b channel 1 } }
  }
  ttable [ [ 1 0 1 0 ] [ 0 1 0 1 ] ]
}

pcm.devhwout {
  type dmix; ipc_key 1024001; ipc_perm 0666; hw_ptr_alignment roundup;
  slave { pcm "hwcard0"; channels 2; period_size 1024; buffer_size 8192; }
  bindings { 0 0 1 1 }
}

pcm.devhwin {
  type dsnoop; ipc_key 1024002; ipc_perm 0666;
  slave { pcm "hwcard0"; channels 2; rate 44100; period_size 1024;
buffer_size 8192; }
  bindings { 0 0 1 1 }
}

pcm.devloopout {
  type dmix; ipc_key 1024011; ipc_perm 0666;
  slave { pcm "hw:LOOPCARD,0,0"; channels 2; period_size 1024; buffer_size
8192; }
  bindings { 0 0 1 1 }
}

pcm.devloopin {
  type dsnoop; ipc_key 1024012; ipc_perm 0666;
  slave { pcm "hw:LOOPCARD,1,0"; channels 2; rate 44100; period_size 1024;
buffer_size 8192; }
  bindings { 0 0 1 1 }
}

pcm.devloop {
  type plug;
  slave.pcm { type asym; playback.pcm "devloopout"; capture.pcm
"devloopin"; }
}

(English is not native for me, sorry)
