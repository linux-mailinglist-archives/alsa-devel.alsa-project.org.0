Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78FCFB4F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1BE2851;
	Tue,  8 Oct 2019 15:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1BE2851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570541264;
	bh=NQ/nX8yOJdsciDoyNy80M/l4p0HjwNWzA9jDVze/e7U=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ksfZc/hAGOKmIcBoyb6sXoBUtoQAMttLxNAjAZyuD9gJOkxg9xve+Ou2x+Wwp6OmN
	 JMyjyul63D69kb1rlb7OaCiQCX8VlUBt3okc+6OI9fmknGmGkIyKVkBfymVtcTYIec
	 Qxz8Le1L7vvfQSAS9T/x5d01fLiBcYEl58j2SGl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4608AF805FB;
	Tue,  8 Oct 2019 15:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49455F80322; Tue,  8 Oct 2019 15:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0023F80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 15:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0023F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jIRzZaMl"
Received: by mail-wm1-x330.google.com with SMTP id p7so3061077wmp.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xJIgnbCApKHBJqe6vRTqyHV3VztHtnNpVAryaZhUllc=;
 b=jIRzZaMl2XKOdOhgcpf5sbVwpTY5AfqPHMTZIXZMG9MtTVydK/GpgjLjhX4RwmaRFH
 oqo9s/19QMb7fCzP6oN1Lm8bZXc6IsdBIMcqw3G3a3+zXfxKvT3yQNN+TuNbEvzXkbvl
 2i7ZQ/ENr3Wm/lDYgdCwPfmCiHFmFxZBq80KDzX969EoiMzY9uCulkY2C2J0aZGU48P2
 47157RS2pfpNGHHqPyeUphBLX6yuxKI3JGFkN464oYYxTl0Ox7m/9ZDP0KpFXVH5+ObI
 pCZc1+MDE4p0HlIP6fHs8BkNbDUdMU0VGeHGPt3LgLkXgIO3aPQa5QGXUXkgd5MRhPi5
 dSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xJIgnbCApKHBJqe6vRTqyHV3VztHtnNpVAryaZhUllc=;
 b=FPyj6ZxadQmY3yQBEqs3rmapN+kWWOE4G+GdFhcpy7Pj+zbbzzACbKN+Cvph/Jnbzw
 kFP4PBO9sitN46Tv+3Vxw29FC+H/u1y4gfLQ5V17dGtpiIjvprFyGEbTVUR9iPkMJdte
 e94c3jAsnRXvZhX0Ee2v5S5F0eGMrra3S6aHkt7oV5z6Vz2cmSNiDno7+SY43fNMqH+O
 zGtu3pzDZjZ1A58ABlPjYa/Kt+X8P2ZR5irhF9At2WGXNhosLZJyCDd493EWxsLYwkYS
 Kpu2Lu9gCaPoBMf5fpa8tYvbUUamwOkEcHkudGBZgUZkB+qN+EqQU+Z5YqBvRIwFNnAK
 QUCg==
X-Gm-Message-State: APjAAAUkmD6C9DJpo5GKU5HZDoS2+OsnLPAshf/Zof8x5FHEl9Dw1HW0
 JUtPsq23RCX949NBI1+nYuUfK3kHG4mV5vLr9PzPdLVUqmE=
X-Google-Smtp-Source: APXvYqw+edtYapkcUYa7SRW28e+EN7DTvx2WokozQh8CSfZakvYyIE0/lRZH2eQJngOuW7Gny/r7gPL7ONk2Kg8LEWA=
X-Received: by 2002:a1c:7dce:: with SMTP id y197mr3666269wmc.171.1570539843135; 
 Tue, 08 Oct 2019 06:04:03 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 8 Oct 2019 16:03:51 +0300
Message-ID: <CAEnQRZDhhZHOyqC8QSmgy+CY5eYSktPUiL6tVF9z_5ACegCsQw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Counting links in simple-card
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

Hi Morimoto-san,

In simple-card.c simple_get_dais_count function there is this comment:

     * ex1)
     * CPU0 --- Codec0
     * CPU1 --- Codec1
     * CPU2 -----/
     * CPU3 --- Codec2
     *
     *    => 5 links = 2xCPU-Codec + 2xCPU-dummy + 1xdummy-Codec
     *    => 7 DAIs  = 4xCPU + 3xCodec
     *    => 1 ccnf  = 1xdummy-Codec


So, I don't understand exactly how did you get the formula for links. AFAICT
there should be 3 x CPU-Codec + 1 x CPU-dummy.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
