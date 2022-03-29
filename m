Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 631464EB292
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 19:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94181752;
	Tue, 29 Mar 2022 19:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94181752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648574367;
	bh=G2gSyeiMxKrx7casA9jg8qtqcQY0Rn2KOz8tiaELqvs=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sj6Dma9nbLAeG8PwYkuzO33kBpqTaucKxuDZivhJq773Oi7d6AoaafuzFpjZ0Ne6c
	 VPr4gCq+FfAvcAECxaq3wAs2BeCjWieh3dKE14X9WvEUDN9FeK2tTyl6c4Vz2+0A44
	 Ny37R2dTf3xN5IF0NKWnvys1X3vIFRu3ylR3arf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D750F800F2;
	Tue, 29 Mar 2022 19:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67493F80311; Tue, 29 Mar 2022 19:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5295AF80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 19:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5295AF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="i+2yFCy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648574291;
 bh=G2gSyeiMxKrx7casA9jg8qtqcQY0Rn2KOz8tiaELqvs=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=i+2yFCy6KtMwfQbZHeQdA/sfmoPeniIgdKDryo/wNAOd78Fmr3k+H6G1lpheym610
 TCiNAnU49KQ6jn3V64NMb6HyPzPMDUYAa/pejjRWhXZQOXmid0G0syOGzKkwxU6Ldj
 Co8eFQuREuzVZh5V8nUkQtsuc9+95Uiod7rY9otM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.14] ([141.70.45.131]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1oC8fI2gOh-00eaSP for
 <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 19:18:11 +0200
Message-ID: <9146b00d-42c8-d965-4374-8b6689fd948f@gmx.de>
Date: Tue, 29 Mar 2022 19:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: ZTube <ztube@gmx.de>
Subject: Focusrite Scarlett 8i6 silent input stream
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BHJuD1tu3dnqVNvdzzfEYtp91CaKMU0iEzN6QV7yaUfLdyIQbz1
 eCeQ0HZTaYmN5EKpUwZa0JzKZCdjJ4kQuEHXcqiZrrd7PMArdHs9VBUVWCeMyLhf5WDDNr3
 TGDj7g6wt4/IPIUIhA1NOVyVZk7/3D5N0V3m0edv6QlILdWZZXJDtuyq4nBO9LghND+QSkQ
 vG+K1Pwwdod2GvGs5kAJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qXw04/acEK0=:TpbN/fOj7gzXeZZix5JOjC
 7D9+Ka5tsIGEz9Vwo6/hSBVSxBcrmC+3WSG1kVC49gUzyRZK5G44h1jSYunqJDTJaw4dYt+tP
 hgDm4K31yabuu9Uv9xSpHZEw1ol83vkJUmWZA9XWYiIWDPqhKEOtvyTmoxEmjXRRdMXJAvov2
 DBgVKEj17hA8YCrDwDrBc5dcenP6H9fppvSEWr8pRkcSMLlAI7c//AcvJxI7cyIxHum6TRpCH
 Ez3nkjTPt9GmhUo6cvbGLk5xFilxQky4zMrK7twu82enpqoWYaf9tekLoZADeW7OjWu0I0VGs
 SMU5yog8o8VnTrs5aA/yFXeubXxuwt6S32Wo8R8tySv3CjlHIqX9g9jgHUHKhT8SV/kYZPMBP
 NVd7/5BFw01jSXYBQzjX+pV+dM9DXIc6XCvBM39F11EMgrYbnLnUUCVfHl2HgmZ+6CBGxvI61
 t/qU4p2k3FCbFK4AKbHSmlI6iUuY9NeJy0Vf3qqibawpOI6NzbwUOlQUTj+K+aenXKFnvlqpG
 oQlDJEJ38bERQgyk8uUrrdPmVRk8z+netuFnwknfX/D4C5vzUwKGhtH7zMXVpfh3lXYSkMZys
 IOePs7nu9yO2UuPCfBzPnCznfxJsNPLcY+qo6fEw6BDsOVIp7C0i2+SquTxqZG1DEeqvFVgZE
 QaOW8UtF552MkzltqxwPLiPyx0PTUZX07h/aMdTzKDqXOuu7oR9Stw7hTrbxM5U16PkgZNFH8
 rs24JdO+97PhotEicuArWsP1AvgzdtAHYgG+I5mkwiTfUxkxinkyZ8HbF60L5u8Hej2WLIWiC
 IL+nCjNn3B7lmmFuLeOZ3mKk9T6Ktp+P/oF/7Kj7NONgI9yIJGKXhsAiALym5AyV7xwmRQpmb
 FoYZ7viBmt2bd/kBeneS/FYeSapBD6ANN6rxAhJR11ZgUKJHwcK6M+uzjvmmJeHn+TndTzLk6
 8c6cVdLMAIqUhCwe/UBzcHzSGBzFAsJLyinCgr6C+NhISBlIOk/v6pSVfja4oCM7VdyZ1jLK1
 hRZ5CSep7+19K4x9sgIw5HqsksN4sLptmPan83tYOgI6Uas6xTx/vbVlDqZFxagEf+k9CmjYH
 X28oWBEdEalqhA=
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

I'm trying to get my Focusrite Scarlett 8i6 to run with alsa, however
while the sound output to the device works fine, the input does not and
merely delivers a silent stream. Since I can't find any reason for the
input stream to be completely silent I suspect this might be a driver bug.

$ arecord -D hw:0,0 -f S32_LE -r 48000 -c 10 | aplay

just results in complete silence


I'd be happy to provide more logs/detail if needed. Any idea what might
be going on?

Thanks,

ZTube

[alsa-info.sh] https://paste.debian.net/1236037/

