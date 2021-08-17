Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889DB3F272B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E691683;
	Fri, 20 Aug 2021 09:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E691683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443036;
	bh=6IS2xSlIFJuzjsHqgXzTbagwQV4EfbdfEDtZ8/Od+vM=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ps2d1AF4Y4yZ0e0zcYzLovFiMAZUveCXbrZ6811tyRW+pRqIZGhzWTfJuYNSBAsqw
	 S9tXy6TRPCb012qRY88ADCPWRvjhrTI46AS7t3ahnzCfBUeaGxpTTOBg4ttRguC1YI
	 GNXHcog9084ZrgvXLZfEOZnkG+rDFmS+eyFCCUFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA34F804BC;
	Fri, 20 Aug 2021 09:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4C9BF80272; Tue, 17 Aug 2021 10:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 799DCF80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 10:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 799DCF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LjgN5Hz7"
Received: by mail-lf1-x135.google.com with SMTP id z2so39971453lft.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bhLNaIlUAynXMcPAdw8YZZKbh6F9QJxgke4UT1n16VE=;
 b=LjgN5Hz7IJCKd5kDTrajYBmM7Qpaf6/hW1YYmRclGSmBK4Wh8T29MTa7czrXF0ai8e
 ylncr/tRYJU7CL7H2wiXUXDHU3nAteD7xpUqTTXhHeuy7veeaSX6P4iXluJwXYT8iUhG
 kM94bg0ahdVJebFUx2eIoLbb1E04CmGievFyfdaFEfqnoWACBzU1bRSh8iaEuzk/DZW3
 /tTVssHqLDtKEeJuW7K+MzhBUN4jNSnkzcQDB1TgwLDIqT360DqXW8nk6impIyWVgN/V
 prXe923qQc8Cc8S690+BGDwbcp+094PadTSKia0t2eRHyEFw5P9DlcnVQndzm45mIM8n
 kovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bhLNaIlUAynXMcPAdw8YZZKbh6F9QJxgke4UT1n16VE=;
 b=I7vP5sKh1hPyo/fPb48JgxSGPuPI6x7BU9dygiyFGc7ZSFNJ+NO9/eLv7x9q0WKy7a
 YG4zU/nRfUlx71N6CtpQVgJ2MthPI4Q4t/AFW1pbpSwN8ZLpf5JTdDoWQkid2p2uq1Y8
 nLm1CCx7MPcB26vVTO8OT1doTASaXXV3JXfWvO0YqN4+KDUz8uBYkXIMf//xBi8SRXhg
 JPMbqPiVohWfl4NiaRC36eMjNjeQ9VBO4T4E4f021s6RssFo/KiXOHGO4PNzAKNfz60V
 oXTHCWO8iQoEc0P62+/IYy8IzWvCakUKxOnWJacS7PcTka/WT6V4JqSfOdD5/3Jy5dCn
 T4Vg==
X-Gm-Message-State: AOAM533U1ALs2BL15am7F2GonYifdQbOGG2L84pesosC6m+XIr8Jg3lW
 wR+5QgMgMRQYxwacTxp4m008TC7fmjLdizcTN1YoVnMFZXHSxA==
X-Google-Smtp-Source: ABdhPJyyXpVjIyGl7OjMAwVHn2U4gvRfJ0u5M64nFPre967KYdENJXXorFwxViaSWo8HuiC6dYxxhOTrttPzqV/5KXI=
X-Received: by 2002:a19:c150:: with SMTP id r77mr1539595lff.511.1629189499790; 
 Tue, 17 Aug 2021 01:38:19 -0700 (PDT)
MIME-Version: 1.0
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 17 Aug 2021 14:08:08 +0530
Message-ID: <CAAd2w=ZD4qiRJkrA23jBazc1u3dBjy_bJY0jbcp03gJFuLsRAQ@mail.gmail.com>
Subject: arecord is failing with -V stereo
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:12 +0200
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

Hi All,

arecord is  failing vumeter option -V stereo only.

localhost ~ # arecord -Dhw:1,2 -r48000 -c2 -fS32_LE /tmp/test_record.wav -M
-d 1 -V stereo
Recording WAVE '/tmp/test_record.wav' : Signed 32 bit Little Endian, Rate
48000 Hz, Stereo
*** buffer overflow detected ***: terminated
Aborted by signal Aborted...

Please provide pointers to debug this option.

Thanks
Sujith
