Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A476B1F0F7B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 22:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB6E1607;
	Sun,  7 Jun 2020 22:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB6E1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591560969;
	bh=kEeZT1E4zoRmLyPDY9KugTspdRA6R5X4WJFgXlZyO3M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9J9ug7AR4TAdFezucSagGOlbS3aLNWiFuKcqUOzB9P0cTupeWsBMVFs2mYqjbSxf
	 xfng6ZrmAeL/VZkqEi9rxtTmtzbuXLUMR1PdfRhKHlRMinK5Bo4XgYcKI8K0k9S+Z1
	 tcweiiK2TOlkS1lBEF7v43GwH34u0vQUILZyOKNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB511F8028D;
	Sun,  7 Jun 2020 22:14:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2837F8028D; Sun,  7 Jun 2020 22:14:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13496F80149
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 22:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13496F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HPuLIXRS"
Received: by mail-io1-xd33.google.com with SMTP id w18so7512545iom.5
 for <alsa-devel@alsa-project.org>; Sun, 07 Jun 2020 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kEeZT1E4zoRmLyPDY9KugTspdRA6R5X4WJFgXlZyO3M=;
 b=HPuLIXRSra8c1JmniFH9y6NjP8nRv9hHJGBKtUYK5W5YoWq4dMTu0k850n0YQlweRT
 cpkUAX6De6isueEj87tzfSkkeoz6JsN3Oqlwz+i3pwdML/e2rFI6kHyrL7nKxFsIdfJY
 eZUfyer5DxE+Laz3plY3msK9Ot8aAINzrt250AWYiK48l8jNe08p/DDQYf6nRr1UIFP/
 I7JCPY3+up75CUisuNvdXsuwYOC9CSQebu+GLxLwNoOwAD3LzNewitoW+37YrU/NQ0fr
 GSB7u/OvlC9wQjE5M3zGhwBhXUO6dqVdni2MA0nsBZFpbMo+Zdek504iBqrkAmwQKX+L
 /COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kEeZT1E4zoRmLyPDY9KugTspdRA6R5X4WJFgXlZyO3M=;
 b=I3Lkdcsw85o7iswu1ic7/czp3g9EuCk5R7U01mvku+XW/5IqMGAcpS8EcnoD2Y4A0D
 3TJxFnvAPKcVYlpfhxRoV5BwWzrlD/XjSDzvrGevhOBWr0YeZbsQ9Pw6BwxM3FwxIRCt
 12Rv7AMHroGWhs5tXrnAOBqq2x1GINKCRhUwyhuwKEtisxauTrGDRiq8LHd5E7mp5JQG
 S6/SM4D760nEpXRVyCJnrfzAYDieBLLWqVvAfRnVrKE0YCsNn/F0Seb5rOaimTSYyup6
 8JQvGs9xbDv1EZacQzHxroFr7uUX8T6eQjt0PkKFsk/IeEyGkjdf2k3mszWZapPRscDl
 lv+g==
X-Gm-Message-State: AOAM5334wBV0s8Zlo1pi7W3lRfdHLo9bGpTE56ieEckhsclGss6kzR8Y
 RttFyhWYKANd3faOVPRdT7XbDUWrW3q1An5PYoBKpGmKC5A=
X-Google-Smtp-Source: ABdhPJxMTSePrk0a0yQxy57KHFfY2m+yXk6Uh9VUg/EKiNB9toYVqo3FQZdVfnvZRuG0iZ7LWva4hgXm8QroolmIYpI=
X-Received: by 2002:a02:a91a:: with SMTP id n26mr19041079jam.104.1591560848746; 
 Sun, 07 Jun 2020 13:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALZj-VpLECyDaBeHcowTnCcufLVaPyr7Xxii+PbkrwGn9kYU+w@mail.gmail.com>
 <bc8420df-3fbe-2d7c-3c3a-dcf7455eeca8@perex.cz>
 <CALZj-VoLtoNbPZ1evLYqTxEg7XaTiEjgdB+WLE7duLfxF2ohLA@mail.gmail.com>
 <15e6517a-6be2-d5cd-c5d7-37a5122bd96e@perex.cz>
 <alpine.DEB.2.21.2006011723250.3787@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.21.2006011723250.3787@eliteleevi.tm.intel.com>
From: Paul Dann <pdgiddie@gmail.com>
Date: Sun, 7 Jun 2020 21:13:57 +0100
Message-ID: <CALZj-VoJ0tMNyD6aZyLdBWYD3meWaqKjo-1wQww0wk1En2nqwQ@mail.gmail.com>
Subject: Re: SOF 1.5 release on FTP server
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 1 Jun 2020 at 15:45, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
> Paul, I can confirm the sof-bin is the definitive location to get
> the SOF binaries.

Many thanks both for confirming the new source. I notice that the old
FTP package contains the following .ri and .ldc files that are not
present in the new Github repo:

sof-hsw
sof-imx8
sof-jsl
sof-kbl
sof-skl
sof-sue

I'd just like to double-check that shipping the new package without
these files won't lead to reduced functionality?

Many thanks again,
Paul
