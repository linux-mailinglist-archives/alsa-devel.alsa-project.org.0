Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2E7F765
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 14:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546F11717;
	Fri,  2 Aug 2019 14:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546F11717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564750503;
	bh=DhxQwd/kt2WCuduu7uq8Bz7L1xix6S0/25Mw6m3V3pA=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q1o5eb2tFn3UY7M8x+Bxv+CkYqH/dokC0F5bxDcfbAS9+qpX/TywNvjOBy7dKZHHl
	 w0EZonbKixYl6qlaCG27+EfGzjsxpvjT+lwYGFK/gWGAvPA/dB+PxPlMHN+DfmUFi1
	 2wWz41I7ranKMEPHYa41/OQeaKRICBNsCJo6xAyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E9BFF8049A;
	Fri,  2 Aug 2019 14:54:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60716F800F3; Fri,  2 Aug 2019 14:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1114F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 14:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1114F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EjT50Em1"
Received: by mail-ed1-x530.google.com with SMTP id d4so72334414edr.13
 for <alsa-devel@alsa-project.org>; Fri, 02 Aug 2019 05:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pycpjzER19voWX2t9V8mkAxM/eVLVmu18gSnVb0f8/0=;
 b=EjT50Em1CBaF31/bLLoYHT0Udk450otn05I7rDQDJ/Jtk59i7V+nmlpFNqN97vz5u7
 1zakMjuxlEMpjuaZ2NkRUwkX0sMlSdq5/qDvlVGzarUW41JDhCU9RKMUrU5UrrAf6BJ3
 VGjozTiLkO4/IwoS94/lvj7pyq4EX2cbTJWs9VIunKejpQL/7541B/2jSJCCBFEy+sIs
 LM7f/d/emGKLyErCTcpyQQsRU58rXaZLKEIWDHpbiwSC3Pw2ISe8A8xZCSHYajXXpGdd
 kYmGFZ4bPcsiGUGtFVBKylGmI1y8zjyMrLv+50tXn5XxyA/XIacjIHi4iSAUPO5dtHxX
 wNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pycpjzER19voWX2t9V8mkAxM/eVLVmu18gSnVb0f8/0=;
 b=uVbYdOX6Bip/GUALGR5bUXKpAWKQFBHXSXSjTNHiAS15vNT8s8m21E0rzRgarP/M8b
 1ZJhKOPo6lZm4NPwNo24GvXpmJeqWWOZGH+LKV9AaPaAK5V/kigb7miazyjVvhISbGK6
 x6GAxfUWaecGVsRhqdmjvO/RGzn6nL3bu1GMWKKu/wm886VtGIdOwp+4WqFXHTHbRwyN
 CPAaS7pW1k/ChIyZMmmPTvI0zO7F8tJHOmSWgaHyeEwabPzBc3faJKNQA57D8dFyTql/
 6H00lPdBhf9Bd3vGQvzUu8uwlHafzWTmOEYSoloxTQ7e6FXFP3VLWiqsGvHtoOVo0kAI
 jrtQ==
X-Gm-Message-State: APjAAAVh9/ip8pJ93HpLZ1zESBZABZO6lOzRLtl3p/kV9guY61WmBiHc
 HY+lKeQYLxxEkiylqwZeUtgVl5VXXweDgwdqx6P+FFOL
X-Google-Smtp-Source: APXvYqzwacdxqNvF5iPNMmskwp3ar0ia86WszOIPmZwE4teTri62e74bi/ixsSD10eGVLVdiopSh6VIUqgo5QFdorXc=
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr119207501edy.101.1564750442648; 
 Fri, 02 Aug 2019 05:54:02 -0700 (PDT)
MIME-Version: 1.0
From: Paul Pawlowski <mrarmdev@gmail.com>
Date: Fri, 2 Aug 2019 14:53:52 +0200
Message-ID: <CAKSqxP-f+4KCUU79prHaLi2--3H8jAA9iXYxK-EoA8oQKNv=XA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Writing /usr/share/alsa/cards/ files
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

Hello,
Is there any documentation on writing /usr/share/alsa/cards/ files? I
painfully tried to create one in order to enable 2 separate audio outputs,
but I ultimately failed to due to the lack of any sort of error reporting.
Is there a way to enable any error reporting when parsing these files? It
seems that the error output when parsing any hooks goes to nowhere.

Also, is this the correct mailing list to get help regarding alsa driver
development and configuration?

Thank you,
Paul Pawlowski
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
