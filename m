Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A81417F5C
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Sep 2021 04:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52AB15E5;
	Sat, 25 Sep 2021 04:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52AB15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632537329;
	bh=3Ut1MItUCH3xG+GcwFLXpnoDFPVSVMyX6fFiQhAfFiI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQxcQtvJZr544Db14VzJLb74FKF9Cfqq+1a5CzXejo6VPr3YeF0IT+qTYvCgQxWtW
	 VG8bhsKaPNb/xjD0AptIYiSFn637jPZENvb4ZvEK24C34PiKtGSeGcbZG+3W3JOIP7
	 qAiVyXFwPVBFVx+ybf8CL0EyKI8pIKNSr1NzOS8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF83F8026A;
	Sat, 25 Sep 2021 04:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CB08F80268; Sat, 25 Sep 2021 04:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA1FF8013F
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 04:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA1FF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z4ey0iMQ"
Received: by mail-ot1-x32b.google.com with SMTP id
 h9-20020a9d2f09000000b005453f95356cso15681176otb.11
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 19:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=kPa5NuUECfTJIXC38o5L1BX1JWkuLyGx0zpzLRqv6+8=;
 b=Z4ey0iMQqazZrf1pOzU9wcem+5O+5wKL/OynSbPeHtuPU42Y7SpVHW6a0FEUiLZ9vC
 JxclsTgK2/XFZsqNhuXNKeqZP80FcSzn7Z3KZblQYYy/zmds1oa6QJTDTFlgc43vTavV
 6WOAGnlKONBQ1W42mM9rBqZiZjN2QURk5txlVhFcIDQZ6eEkPoO9mHIECHlZ5ssKTk8L
 iXEXFdzYctKuvF5bjlpr/she9AX+YK73u9aZJk1dR75tpqhd9aQIRnaQe1XzIBDqxxuv
 znJuozg9d/z1FAdEUFdNNwejoLS35DGZfKnAULaqKY/P6kX8/HbGSYTB2g7eBtsxJHem
 ajQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=kPa5NuUECfTJIXC38o5L1BX1JWkuLyGx0zpzLRqv6+8=;
 b=7gyCOUiUigxe1A66lXJqWXZW+lm47JZZ2pn/wS8hAN+ZjwYv/mWfJP0rz+qBTZlkYa
 QiZ86glZVijnQGpHuEJfGoYGob8VFZgTPyxmbIxIIc5rUZuVYC/jj7QM3SQa3WlvePIN
 GLSFsz5Hd3T/IrLU4/TCI9F37AZc8TVmGpQtOilwYlr9UrnDyGyqgqLDedTvEg3qCMuJ
 TQtZGBhzf3x21jDuLabfnQk8XmuqOeIt22ZBUCpUgStKGr/sB+K9QvC2kbhuQQrsXqOe
 ej2gv0t4J3cadXRa0DfGcMZQDKx5/eLyTow3il4oT0/ZuNI3fB8zRvtuHmxzVeumOn5Y
 wrfQ==
X-Gm-Message-State: AOAM530SrYB/IiAOsop42XqkLAtPsIfJ6W2/hAjTlUVSluDYnppmnXUM
 AKlAOOB/UHEJWsDf+3L8Jgw=
X-Google-Smtp-Source: ABdhPJxDmcoPd2qHHJFCCcygq176ddGo+o9RuEg8chtaEjqLqG2bQDB79XFUlfXeXtg9x3Yo36J9Gg==
X-Received: by 2002:a9d:600d:: with SMTP id h13mr6730357otj.265.1632537234258; 
 Fri, 24 Sep 2021 19:33:54 -0700 (PDT)
Received: from geday ([2804:7f2:8280:7522:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id v186sm2761502oig.52.2021.09.24.19.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 19:33:53 -0700 (PDT)
Date: Fri, 24 Sep 2021 23:33:51 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: tiwai@suse.de
Subject: [PATCH] snd-usb-audio: fix comment reference in
 __uac_clock_find_source
Message-ID: <YU6Kj05oOqRmhJDf@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org
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

snd_usb_find_clock_source and snd_usb_find_clock_selector are helper macros that
look at an entity id and validate that this entity id is in fact a clock source
or a clock selector. The present comments inside __uac_clock_find_source give
the reader the impression we're looking for an entity id.

We're looking for an entity id indeed, the clock source, but since
__uac_clock_find_source is recursive, we're also looking *at* the entity ids,
in the search for the one clock source.

Fix the comment so we don't give readers a wrong idea.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 81d5ce07d548..7dd71d342443 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -271,7 +271,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
                return -EINVAL;
        }

-       /* first, see if the ID we're looking for is a clock source already */
+       /* first, see if the ID we're looking at is a clock source already */
        source = snd_usb_find_clock_source(chip, entity_id, proto);
        if (source) {
                entity_id = GET_VAL(source, proto, bClockID);
@@ -297,7 +297,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
                        goto find_source;
                }

-               /* the entity ID we are looking for is a selector.
+               /* the entity ID we are looking at is a selector.
                 * find out what it currently selects */
                ret = uac_clock_selector_get_val(chip, clock_id);
                if (ret < 0) {
