Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507F15F4F0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 19:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D23B165F;
	Fri, 14 Feb 2020 19:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D23B165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581704733;
	bh=LR+wROd3jc39QyYViD74ZA3XZfpQIXt+GdVSw8/dNvA=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KmYTvTRRJzBsrMtUVFfZe1haef9DH6ETRzd/4ik0EKEBzbIUBZC0QYGke5RpiunoJ
	 B4rO+6iALCIsrXsK4M9vgmdqO91ulQXxmisnrpHU4KVnhePGQj6Nso2R6m4XWL9k2D
	 1MGyxMUVWDLoYTa6ZMI/jvkbiIjofELUYYi7ih5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA30AF80157;
	Fri, 14 Feb 2020 19:23:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5F9F8014F; Fri, 14 Feb 2020 19:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01CF3F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 19:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01CF3F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EVYpOP0P"
Received: by mail-qt1-x833.google.com with SMTP id t13so7600586qto.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 10:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PxmPYL/0+gW77aga7Maj9oLHPLdYATDAgkCflVdGkbY=;
 b=EVYpOP0P7CRY7zDtCOXoxHxT02rlwugpi+INovp56/a5l7u5FTEP+ZLncJyySJsWG3
 Yr0j+OVzgzHIblnatPHdGvtIpkCw30bqsZe4aeby1hSiQs4Q7154Z/NV6Z9O36k6sSHT
 x7v4JpSzpt7rnetRtQ0YENWqKbgBvwlOArqi5WJPOldtg3xkS6tylw7eHUAA/1Ly0pnE
 zCXrkO62+7EsCHCcalxuRQIji8XibAg8eM6zEdVyrj5wXNBuCKhujRxk4SFbTlQCCCqX
 ftXHH7MkmceYAdjDW9Rvu7oo1WK2F0GPwB1PqlW1vqt1mNwdG2Q9JJC47Y8FTX5BEa4H
 AgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PxmPYL/0+gW77aga7Maj9oLHPLdYATDAgkCflVdGkbY=;
 b=OCIMQLbvmxMbveRKEScPJmvKaGQo7QqgWhya5AXaK+SecgtI+cmlmHIwolVDNxe9Yc
 XcUdmO1ztCOhZPBkUuvQHzS/VukJDd+EYFpQK0iqUBFysaqQU+khV5NWaiommKaKojFY
 pqZ/9WQdK0Gk08JLkMnuJ3wmwxThgNP4V4ZaCXEmrQAGnMp2pZFMSiMNklNrDHbltw5X
 hJ1MaRCM6givkCGGidW4Wh4XtrmZUW+1dqF0wpG4edNFuuabf/2GdCDkyTLrkz/GMrfa
 Mw+byvK44yphVmuHFW+pGhQVL5Q1i2QqjJN7P59WMzOiL0vPdGLYWgMCu23zkrGQQzTd
 kOmA==
X-Gm-Message-State: APjAAAUsvLSjf63B9eO58Od2wzbdhC1mLKGOQw9gdO3r2J+D1od4ysLA
 GxZA97ggy+a3yxzsfkLvp73sof/Hr3ZU0zD1KGshCASrJRknSg==
X-Google-Smtp-Source: APXvYqyPj6LfLZKAd+MWPDq38FyhWe+0ypfGQIfOsvNJ2smLZKoMLFFn6kriMw3+SVKjZtsjeK3YXSGvdfJJDUMiZDQ=
X-Received: by 2002:ac8:5502:: with SMTP id j2mr3753966qtq.127.1581704622421; 
 Fri, 14 Feb 2020 10:23:42 -0800 (PST)
MIME-Version: 1.0
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 14 Feb 2020 10:23:31 -0800
Message-ID: <CAOReqxhbvG03QvqkbjnGB8w5cM4WOK4qeZ+bh0apNna7i3ZimA@mail.gmail.com>
To: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: [alsa-devel] alsa-ucm-conf via portage on arm
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

Hello Takashi and Jaroslav,

There appears to be a upstream package issue for alsa-ucm-conf in that
portage seems to have it restricted to x86 and amd64 platforms. Given
the nature of the ucms I figure this is an error and was hoping you
know who to speak to in order to resolve this. If this isn't an error
what can I do to help get the repo to state in which it is supported
on arm/arm64?

See https://gitweb.gentoo.org/repo/gentoo.git/commit/media-libs/alsa-ucm-conf/alsa-ucm-conf-1.2.1.2.ebuild?id=dd3e0570e2465639431709bce0410b787d312bbe

Curtis
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
