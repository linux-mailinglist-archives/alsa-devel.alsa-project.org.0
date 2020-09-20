Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E2271DAF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6553716A8;
	Mon, 21 Sep 2020 10:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6553716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676124;
	bh=SaUuOqHHtnvYUPpS52BsZpQ+3kerk21TuzKHbDtuJDM=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NRvgrItE3gGF1pNM4BU4sVvSWQPzPMkLF6hsbhcmGxREZ6HdIcH3Zw01wiHoCP6jA
	 d5vgCq4+GwxVNK9dZpsoB5sDgVpLNWdbd5dTUat2WeEu4zTrTwMtYsSBd2zZJuY6cR
	 GkVGE1Ht+SPTke2+tYZURt1LLHK8jzQNamUoNab8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D58F802F7;
	Mon, 21 Sep 2020 10:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668B5F8010A; Sun, 20 Sep 2020 05:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D9DAF8010A
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 05:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9DAF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fZQF13za"
Received: by mail-pf1-x432.google.com with SMTP id d9so6170285pfd.3
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 20:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L0haqhM/f4eHwinidXOfbxQ8n/VFYGprkopkW/9Mi0U=;
 b=fZQF13zaRINdZJJZFFeQBgkl/Kqfur1EWGIfvSsU6QfdB5QR6QSWhqNmzNyo3KlL7k
 J0gDVMErSIb6LcjlkkSsL+DE9aLKnNw07DnZ2dnsXsJFGaJODsIhxj0OKj3nWWxnR9sK
 yHSYnrp0ciKJX2Bki5Xsgz33JxE3Iqy/dG0d2SwmK2IPFAiVf5lWTHX5TUHV1C/yGW5d
 WGqDP2Af3M49zNZbF9E/1+sLbwoFznmGDKAgYLc9Gub+S8+OvXi5SnIdpo9aAt4AFNcu
 sQnUV7LiDJXGG+qkwjAmXwtYhuufad0i0raWYSWcYX14P4fOIHiGxxwZHxruPqf1LC1v
 klcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L0haqhM/f4eHwinidXOfbxQ8n/VFYGprkopkW/9Mi0U=;
 b=VJPxzvgDVdoIEsnSRCR16N4MoXm92CcYw1IYxUY1nTqcCPMiKtnN8+1KcQQpUlBFH4
 /KvjCTS57spdg11XdhnH4j2zCWCIBg2zwzqRmEh0vkq/C6EtdD57JyCF00AK+UuX3Git
 qTHvv12lSnFvdCyvJ7kPTtqr1sx7hAdrI1aUnz9SG9p18nunaaAxwScrk58GX2jud4LQ
 lsD9LHcaOQs9LdzyNwHan1hM21TN/kUTpZ+gCdi0oblOM1WLW99QoekyAgh3oR2Vvn20
 FVq3EvZmjAh9GIto4X27bhsWm4QZDU/SvMEqpHvzCf5gQu2v0j/Ofg655lxgFMSkqK7p
 o9Eg==
X-Gm-Message-State: AOAM530SEwQ8mcnF7Zvi53MsO6BTaffS4htiQchMh8S8+9p9oFiBxb4y
 AZNA+MU3n8z5eyQXLlg43sW/OO5wM/SYv7pERb9ocrdifYk=
X-Google-Smtp-Source: ABdhPJxkdw2iMnD0nr1OtwZlgO9EDz11/8DiEnKPxDKtU3DyUBfOjxANVDOQPW8HCGl9ZPSbUmiqT0K5fV41SVHO9qo=
X-Received: by 2002:a05:6a00:1703:b029:142:2f13:f1c5 with SMTP id
 h3-20020a056a001703b02901422f13f1c5mr20273286pfc.29.1600573614795; Sat, 19
 Sep 2020 20:46:54 -0700 (PDT)
MIME-Version: 1.0
From: Brian McCarter <bibocc@gmail.com>
Date: Sat, 19 Sep 2020 22:46:24 -0500
Message-ID: <CAF12ROm9XmBtfZL4ZrwfPL_=0JO1XsUs682FqsSL7ouW__TQmA@mail.gmail.com>
Subject: USB-Audio.conf patch for ASUS Xonar SE IEC958
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="000000000000bfa1d305afb695ed"
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
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

--000000000000bfa1d305afb695ed
Content-Type: text/plain; charset="UTF-8"

Hello,

I recently purchased an ASUS Xonar SE sound card and found that the IEC958
output did not work under ALSA.  The attached patch to alsa-lib enables the
output.  I can see that the SE is among several other Xonar models which
require special treatment to enable the S/PDIF output, but this one appears
to be the only one which puts the digital output on PCM #2.

Brian McCarter

--000000000000bfa1d305afb695ed
Content-Type: text/x-patch; charset="US-ASCII"; name="xonar-se.patch"
Content-Disposition: attachment; filename="xonar-se.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kfak2h260>
X-Attachment-Id: f_kfak2h260

ZGlmZiAtdXJOIGEvc3JjL2NvbmYvY2FyZHMvVVNCLUF1ZGlvLmNvbmYgYi9zcmMvY29uZi9jYXJk
cy9VU0ItQXVkaW8uY29uZgotLS0gYS9zcmMvY29uZi9jYXJkcy9VU0ItQXVkaW8uY29uZgkyMDIw
LTA2LTI5IDA1OjUxOjA4LjAwMDAwMDAwMCAtMDUwMAorKysgYi9zcmMvY29uZi9jYXJkcy9VU0It
QXVkaW8uY29uZgkyMDIwLTA5LTE5IDIyOjE4OjQ1LjkxNDk3MDcyMiAtMDUwMApAQCAtNDIsNiAr
NDIsNyBAQAogCSJBU1VTIFhPTkFSIFU1IiAxCiAJIlhPTkFSIFU1IiAxCiAJIlhPTkFSIFNPVU5E
IENBUkQiIDEKKwkiWG9uYXIgU291bmRDYXJkIiAyCiAJCiAJIyBUaGUgYmVsb3cgZG9uJ3QgaGF2
ZSBkaWdpdGFsIGluL291dCwgc28gcHJldmVudCB0aGVtIGZyb20gYmVpbmcgb3BlbmVkLgogCSJB
bmRyZWEgUHVyZUF1ZGlvIFVTQi1TQSBIZWFkc2V0IiA5OTkK
--000000000000bfa1d305afb695ed--
