Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879C3113EE
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 22:53:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917A61676;
	Fri,  5 Feb 2021 22:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917A61676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612561983;
	bh=NlS058qpNLNjL5XObGpRjBYhUaVuDX6EdFDWlD/s3jE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/mBWf4U7N/1B2dLF/UxlXEBzWEk7BCD3PAVWWfAhSdXMew6uVHn2dQJHEWgPtZHv
	 1NU8dBbNNrXgCg0NmWuCB9Z1+eG3bWeiEcjcp509o6zPaDqdvB2F9+coCLtTrotBMx
	 mgirQg9gkZmoqNYi5UzcPaeyIaUOILk+ZakPJ8dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED3BCF8015A;
	Fri,  5 Feb 2021 22:51:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECD3F8016E; Fri,  5 Feb 2021 22:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCB7F80156
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 22:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCB7F80156
Received: from artex.itiv.kit.edu ([89.244.177.100]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6bo8-1m0SWR1BWQ-0186vC; Fri, 05 Feb 2021 22:51:17 +0100
From: Fabian Lesniak <fabian@lesniak-it.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/1] add mixer quirks for DJM-900NXS2
Date: Fri,  5 Feb 2021 22:51:15 +0100
Message-Id: <20210205215116.258724-1-fabian@lesniak-it.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <s5h1rdyfz3f.wl-tiwai@suse.de>
References: <s5h1rdyfz3f.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GZLVIt0o/mqFq94zWRcfuo9i4V2vyoPeJ4I2jraBhIaUSxzxE/K
 1A8L2h4oLsIaoHx/YcpmNZ/a4oaK5xPe90GG0TI5O/eDHukqp0HpNxKbHPh7FsNfRBh43S3
 Ek1WPuJC1H7dG/JSuZGm/yZxQO5LZqvS8DFwGE3kVmzuhO2RU0aK02O0lPtrDw2IBsNNqFy
 8FtLAOPjoxd4TKrGzg27w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NrPLfLQ8bUE=:mwqjK+DR3/C/f530Uj2HJD
 jdOB8Jgd9iTeArkyWHV2YOHRGbJJCEQ9oPnW9vNmoDc/lvMSgm34iJbZRd3epH7f2IAJfCCPG
 jySfDWo6l9jkLA8u8ezH4H+AMYQ+r5vdPc89KL5CH9XLlc0h/eHNBB3Njk+9XotBan1WYBwOH
 bF0I/aUijqtkOjzV+9qsZN6f6cmloJSL8RJnnzYDDnJ1K1WvWqmMjtL1wUNL+tXzVi8yK97pY
 dlNTnM/5GCXvsUu66CXEGUsy7XtBuQZxV4WLB5nXAab+APjlgqcw3hxAzvwsxB7KBQ6ST3UvC
 uX2uNyrUvQqH+KTv9ZiFla9dDeWlX5KWadg54WR+Fa9uiioHQWzEAdmoOHpQgKt1iDY+uLE0P
 jZuvpKr+1bMrcS4sbABjoFvppGrYJkXNnjYFbgznMayXqv88j+me9uNebQ0Kkk7WdMGLJlFD2
 nnMo8EsNzg==
Cc: Takashi Iwai <tiwai@suse.de>, Olivia Mackintosh <livvy@base.nu>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Fabian Lesniak <fabian@lesniak-it.de>
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

Here is a reworked version of my previous patch for DJM-900NXS2 mixer
quirks. It is now based on "[PATCH v4 1/1] ALSA: usb-audio: Add DJM750
to Pioneer mixer quirk" and should apply cleanly after it on
sound/master. Thanks to Olivia's work, this patch is now much shorter.

Fabian Lesniak (1):
  ALSA: usb-audio: add mixer quirks for Pioneer DJM-900NXS2

 sound/usb/mixer_quirks.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.30.0

