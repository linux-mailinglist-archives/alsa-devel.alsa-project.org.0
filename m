Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7614707B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 19:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6801681;
	Thu, 23 Jan 2020 19:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6801681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579802939;
	bh=V/MA4PYBYEuMvyfm9hoc5i5uQ5tEjQfn12SfqRURioA=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f7iQ/WMoNTMgnTUpyMhThrPVwHmuHUXA6DdXlASiNDjlL9y0pvycMNuBzfj5Wm1HD
	 1GufwqU2ezUsON2tUvyPwdBpBykEWxLoEq1Fn0+jushf2W3EG+jfrz9GRbvAaFJfUK
	 iYRGPAO230lP1JU+Qx0rIXZ4yK7Rv+xafjFMj8+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9041F8015B;
	Thu, 23 Jan 2020 19:07:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943A9F801D9; Thu, 23 Jan 2020 19:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14C34F80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 19:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14C34F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="1a+iYegw"
Received: by mail-io1-xd2d.google.com with SMTP id h8so3898147iob.2
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 10:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=jI4BxDUjBCPDf8Y+U8dqvpXjVYpgE4JSPz1AgpDJEr8=;
 b=1a+iYegwZU581lfh7lWsTtR36b9UhtAJ+HoPI1Z0DZqkQcga/Gqw/qV2yZrZsb32cQ
 y3tmEytwBc9xzIPyOUqZTngde1Lu4f2UiGzLStUjsq09quVcp3xZTB0rvfAzivQcm/FK
 85yc+ksuV81KHWQwwU1hGP6wUFqGa7aRdISpoEO5+J0U53ejYlBK+tIDPi12wywc0l4q
 WyKjikQg0hTWmJSSA+lMYDzeMR8T+lEjZ3R5gxNFjCwad+RBj/Fk5DuvewJ+VPwTc6QL
 hIiBhRemoJ7suHry/ITmDuUC9NcLlI68/BwB5lt0xP4KHmXKTUiZKR/hshedWi+EIdhs
 HgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jI4BxDUjBCPDf8Y+U8dqvpXjVYpgE4JSPz1AgpDJEr8=;
 b=dBDb6QkWrQJgxUxjZ6l1rmz+62obaaFyikFzz1y13c+bATKgEHFpJHcgc5h8miYH3h
 cdDgbkKgKDxgUxNHttizCOnEcG8o+RNOLGZgkASoBYTEYk6z0Ex8C2HFdSnyAHN8ljqD
 ZgArtwV8+rJwkBCj3CQ0pjNq5A6LP3Iw+O3YAGhsgVQD/mpmzvNeP0Jih3DTtpaA4Du+
 j4DZ1qdX12HHE+sJ9RjlOJ5wDsd7yIUJty6HdK2dpwMm5GMI/Ywak1RwTSQztIceWCx9
 jgn2MiEv1YloktkypW/ruXJMLfjuO/AEUP7ECjkh/HfTt4wv30+EoqrUtyB9ejGxeW6m
 X/eA==
X-Gm-Message-State: APjAAAVDlXb89E1kAdtdHLG251nqLFkrqkVp2wL8JcSDvvVmDJKHcNPi
 s3TTaaV6jj29KrdjZl/IMSbLqUyFtwJ0UCH4nLCor1UOTuA=
X-Google-Smtp-Source: APXvYqxYTDmuM1Ig/oRWW1sUv9uD+2wNu/22CBtb7scMQJYTuIzyHYsycGzYWIevaj7irLQW06K8RkX8s/Yoou6CQqQ=
X-Received: by 2002:a6b:7117:: with SMTP id q23mr11681345iog.153.1579802827802; 
 Thu, 23 Jan 2020 10:07:07 -0800 (PST)
MIME-Version: 1.0
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 23 Jan 2020 10:06:58 -0800
Message-ID: <CAHXb3bcrSnAnwS+-HY8jh4eoBdt+tBoZTHSr-5jsGomN156fFw@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Implicit feedback solution for Boss GT-1 and maybe
	other devices
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

I received a very helpful email response to my previous thread about trying
to get the Boss GT-1 pedalboard working reliably, and as a result I now
have a working solution.

The issue seems to be that the GT-1 does not send any capture data until it
gets some playback data first.

This block in the "snd_usb_endpoint_start()" function in endpoint.c:

  "if (snd_usb_endpoint_implicit_feedback_sink(ep)) { ... }"

causes the system to wait to send output until some capture urbs are
received.

As a result, both sides end up waiting on the other, and nothing happens.

Simply commenting out that "if" block makes the GT-1 work perfectly with
implicit feedback enabled.

I plan to submit a patch for this after I do a bit of legwork to see if the
fix works for other recent Boss devices (Katana, other GT devices, etc.).
Perhaps making the relevant "if" block conditional on a flag, with a USB_ID
switch statement to set the flag? Any feedback would be welcome.

Thanks,

Mike
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
