Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8D1C36CF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 12:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2D116E2;
	Mon,  4 May 2020 12:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2D116E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588587862;
	bh=JPr0gml1nzHx+kiGl68gqk/fSvnNA0zfBdaaHX3/GXo=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D/y1V4/wBL8Fj/BAsz0085gEPSLk5UScfjqdwHhLNFNkxOq2YFdwLs9tvxsXSKRf5
	 u1yB1Y/wc+i+9GrRBytkCM8FkVVl9Pp+Mzv5f/Fh0Rcghbkoc1RdU9sJ9wSISVcPxx
	 CAFn6m1tgeLi9Noi7yAtTl1ETX3KDHhbCjCVCshM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9E1F8027B;
	Mon,  4 May 2020 12:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BABBDF800E5; Sat,  2 May 2020 17:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440D3F800E5
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 17:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440D3F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oqe3zQwJ"
Received: by mail-lf1-x131.google.com with SMTP id l11so6064646lfc.5
 for <alsa-devel@alsa-project.org>; Sat, 02 May 2020 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WDxG6BMyNjjsPs0QZDn7toW+dX5nfJC6ewluoZAGNiY=;
 b=oqe3zQwJgXQ27jO0pH6lfQ/tHeLpEv8l3ja5+pi6C/MhWxj6fvEZWSwNvOEDfy3upn
 5qrrxh1XA5NHZYL3597cx9wSCm8QcYzN/9yorbDZiHBAsIqvYp4V9l0UVEcH+MDdBdJ0
 4F6WswM3xN/mF7plUHJLULpGKpmLAcOzqdW63MFVEUhlYq1DQp3z0OgqPQYv4I8KVcD5
 FlKoJREkNYjBWPWIHWSStkc4XafdeyMZt8zgFJYNPPqKQKmiFwcBkQY1x8fMBaobYg9V
 OAEk66J3kFlKNIDwEYh13D78d5xTI5NvDvQCRxBdhvSGjAt5wC4frptxX14WCW3HdAF4
 rbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WDxG6BMyNjjsPs0QZDn7toW+dX5nfJC6ewluoZAGNiY=;
 b=uernXFRDn1VZaN9FtGOJzBJwOMAO+wgIWh9XhO4uoELJFbl5fsYqKe3Ov9HYVJXBVS
 ROokix0xDrhJUfpFw6el5fP6B9HaAKA61corD2DSLmw99WzeDVUPm/3/ClipAMpU7u/O
 J+nCl1rEHNbjlulp8+qBwoO1tpu3l8vo3kWPsTIXHFCq45xHHEw1ZVkdUZvHXzD/U5Y8
 1g8zTDdYjYzdHC9OwE8XZYnPMz+lyx8IXuju9tA5mbMdPJNTMuHuunXbCbcYyYP6UqzI
 KOHzq5dsdsdOnI8ohWNviLKPcF+RrvLcmOU1bI0QOJBiTu38QnNv+Nz7/ggIA0um8rlq
 HsNQ==
X-Gm-Message-State: AGi0PuZnhGg6FelQkJOiAcWwCavXaEzhL1NloTo+StaVVqfLE8FNamJF
 cwoW8TD/YfgitJhVnfsSg97AAKglK94kg/JcL2dpuP3AWXk=
X-Google-Smtp-Source: APiQypIi464qhmc5NUvlbxx0Y82ogzQYutIef6lBpug7OYNS1WTbUV7EkUR9oUuXkPtwf3subkUQA3x++6WG7kYXW+o=
X-Received: by 2002:ac2:5607:: with SMTP id v7mr5713470lfd.212.1588432225649; 
 Sat, 02 May 2020 08:10:25 -0700 (PDT)
MIME-Version: 1.0
From: Alexey Kuznetsov <kuznetsov.alexey@gmail.com>
Date: Sat, 2 May 2020 18:09:49 +0300
Message-ID: <CAO1Zr+o3L+iXeV8JL5VN=0XbLV-=U=DxKUkokmkq3n0Xaqq=zQ@mail.gmail.com>
Subject: windows 1909 drivers update breaks ALC294 sound
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 04 May 2020 12:21:36 +0200
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

Hello!

I recently install recent version of windows on separate partition and got
garbaged sound on booth OS! My old version of windows was 1803 and everying
was ok, I updated to 1909 and it got broken sound. Probably due to some
firmware / configs / updates on sound chip. I let Windows to update drivers
and notice my sound card driver got replaced by realtek drivers and sound
got fixed on windows! But linux still not working propertly!

I put more details with alsa-info output to the ubuntu bug reporter, for
now: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1876459

-- AK
