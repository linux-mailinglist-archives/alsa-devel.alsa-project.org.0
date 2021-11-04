Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB6449854
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4B91674;
	Mon,  8 Nov 2021 16:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4B91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385527;
	bh=uNzaz1UQPLUrJkRBXDRwzTGl0sqO9gSVTVjV0Zae6Kg=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=px0ZOErfGXWYP22uxmd7hwLD1iZqo03qD01u/UludJr3Rku0x7eO5S1iYFHFZYaa8
	 IZyg4UukkrYZ0LySM97clHZbkKF+8XAHAfiVHI5Bn3fItpyuLzH8skc9MLwkspiMY/
	 ch+5wx0D/i4G6bHdUpa62smbqwR4cVJjyFSPPINU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 459A1F804BC;
	Mon,  8 Nov 2021 16:30:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E93CBF8025D; Thu,  4 Nov 2021 12:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62819F80125
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 12:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62819F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o6MTmTCK"
Received: by mail-lj1-x236.google.com with SMTP id t11so9056640ljh.6
 for <alsa-devel@alsa-project.org>; Thu, 04 Nov 2021 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8hZuckGpSTLBxwV8a3u1nj+UStPsCRHwC+yMfEbOgy4=;
 b=o6MTmTCKBt7v+nhfAzHtcaCe/0DbivhY/Fy7l+dVZYDg9zHai9vFp5rwWKogSqlPnm
 NX75LFkiQk0C34gEhPnzC/eZ+98W9vBjfh0eSgJ48vnnqWHxLkBVUuyHVnesj/roRGUe
 Gd5w/jRCEcPFSk8ufnSLYtrl3NngAllGuwz+7vJoK7RICpl8sxshz5HFNKJnIx6MYS+B
 i+OMSWm4PvANAiEaHvR9yalKg5fftQTCrr+uxbk5zOsmsOc7+76qfkLqSIm6y3KcsjCe
 AXwkNmV/ZdMWuecsJR2qibZdlpQPzD/IX5zGD3WG8GV+tvjYNwxCExjsuS8a/c8/t7xT
 bJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8hZuckGpSTLBxwV8a3u1nj+UStPsCRHwC+yMfEbOgy4=;
 b=54AHTwM8BtQx8BkS9MlEhbzin+gtru5EY0kxEnfmwSh3zK9yOcMD6D+JB7LjecoYav
 Qn1PJx+mfuVNpewJhCXL08/t9st/5py9dymVnr/g5zu9Y9dvtD5pWePfSQGlJOF+zSl3
 koZCMvnBaCv2nsCZJSv4maf0SLVSl5Ge15r8ktKIz7TgDvqTYBsOezAcPJcU5MwpKX/6
 11waL/58GL9GYLPafF1kB24kM4l+iVav3U7XjqkojWhZYEzdhIp7ly+/xv5eNz4McFTB
 Tdg9aDcrXpQMRSjbgzxa1yIFZmH4vweVh1QblOirQHxFmkMmUprHqvsU915tvUSAHP1i
 cBFA==
X-Gm-Message-State: AOAM531/REbioVJdup8kN5nrqndamar6PdlmW2ogGsk048Aku2PULtUM
 a4c7ZVypGO1LHv3iUkXPnrVtd9XYVXdnN8PYS9st0tFHb0l8CA==
X-Google-Smtp-Source: ABdhPJx5KRrdvKOGpm4YmvcuBTFTPA+oA99RnzrrIW3KMVP7R9eqLbX13yd9doTuRIL3yJkvLgrSvfjmye1ZWWx3Q08=
X-Received: by 2002:a2e:834b:: with SMTP id l11mr21698236ljh.339.1636026806106; 
 Thu, 04 Nov 2021 04:53:26 -0700 (PDT)
MIME-Version: 1.0
From: Emre Fidan <thepipespecialist@gmail.com>
Date: Thu, 4 Nov 2021 11:53:15 +0000
Message-ID: <CAAsP+8cBCV0FstEvaJS88+CWzLXBPdrR5yKP5KdyFf=EQcEk0w@mail.gmail.com>
Subject: Creative Soundblaster AE-7 Headphones Issue
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:17 +0100
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

Hi There,

Headphones connected to Creative Soundblaster AE-7 are normally
auto-detected on alsamixer, but sink shows the headphone port as not
available.

alsamixer can change speakers to headphones and vice-versa, however, the
audio silences on the headphones after a couple of seconds unless you keep
system sound settings/easyeffects/pavucontol opened or minimized.

acpi_listen reports Line-In plugged/unplugged instead of headphones, trying
to reassign the with hdajackretask does the sensing (acpi_listen shows
headphones plugged/unplugged), however, no sound from headphones this time
at all.

Any suggestions?

Thanks.

-- 
Emre Fidan
