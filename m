Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301721DDA57
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 00:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F131854;
	Fri, 22 May 2020 00:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F131854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590100765;
	bh=8Mscufd0BWLeJeX1FkbxU+Wojkl4I+61x8ecAKQ3/QA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rJOXSj85iwA9AX6yTKVmiJ16sp9nQBbzdljpDRHb6YNMQR8EcNkoUz0wuzqats1GS
	 y3/86IoY8dJSUfX9N51Opx0YW8hmDIxTIdiBJz4HilHadYWWPhkrGL0Z9iXUPTColI
	 GQ8gEfkcvDLA6VwODW0IkxZK2wnrfQJbh6xlRFf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF1FDF801A3;
	Fri, 22 May 2020 00:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54D09F801D8; Fri, 22 May 2020 00:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F979F80161
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 00:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F979F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JydLeZNX"
Received: by mail-qt1-x833.google.com with SMTP id e16so1007684qtg.0
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8Mscufd0BWLeJeX1FkbxU+Wojkl4I+61x8ecAKQ3/QA=;
 b=JydLeZNXHAMl9VjOFjji45XlVdXN+LCuS/Ph7QmODLtVmvr5xsNTFWgMtfFec2MnOK
 xzTWanKj69A5fFaUyq+YGV28MH5Tpn1PGhcTcqcNg2o62yJVCm8BhlBWgLGWfIhQqLdW
 Jja4UTprh0wNhicyo1B1d9gOjyljhzB06xmAIxttQWdPssdNgdXBHdI6g8opzHD3nVBL
 PGI8wrxFgoBtsJS1B3ZBLpQkFPulLCtMxldGkdEVjLaM7goge8jlNbfBX3YNxhOC6Y76
 /KbAO5jbpDc0QdBxCLpCDB5/zZpa7FlWPlb15uwG640NZsh7SbXSdTiI/11QYp6zn4Jb
 256w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8Mscufd0BWLeJeX1FkbxU+Wojkl4I+61x8ecAKQ3/QA=;
 b=qf431pwzCJ8O/Edhr1Tv2Nc3ts3O7oMWpyqXz/BSFMuwxe4FdiwBaDbp/VLA2nzrO5
 MEDyWlkRhM5KGXrVf6Ug47fFoFZkFl+rTqrSZfzG8c9DbEN6rTd+9zQM530m4yWRnsN9
 dsSFMnFq3Yno8NM4Ew3IZgtkWDnCg9aeN9f6NCtnx+GtLJKfSpiR4gTx/xYCnz+Av5SY
 NFedVCU9lwE+yDwdlfOp3O3vh5fzNmS/lfG5E+meK3LGjbBDDVkw2wmAIR3LoNmM6hOZ
 C2hT7uYm1OltZBoNWtdaufGkTKNtfgQhySgJyb6f95s9Wzw+1n4Z17JZT/JcsQ/DfGAo
 a73w==
X-Gm-Message-State: AOAM53377SVFLKpn2k2ecmpOF82cPY5ItcsSoY5dP2gH1jrAMD8/vX05
 p/Tt1Su3boXLH3a+MgypRWnhRuBe0wG8+X3EW206yAYS
X-Google-Smtp-Source: ABdhPJy4VgghedfqaXnHFZ+yMZDHnTiF/Stk0kdi3hG3XzBoxF5KXaDEAHK1ymVv3mt3IT6wUCMnKWzrblr1/LPW6ks=
X-Received: by 2002:ac8:1c3d:: with SMTP id a58mr13346953qtk.52.1590100655384; 
 Thu, 21 May 2020 15:37:35 -0700 (PDT)
MIME-Version: 1.0
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 21 May 2020 15:37:24 -0700
Message-ID: <CAOReqxibTrs0Gvc9QqKsJhKE1y39LYkE2jvVzW9cw+c3Eg79cA@mail.gmail.com>
Subject: Difference between PlaybackMixer and PlaybackMixerElem
To: ALSA development <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
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

Hello Jaroslav,

Just a quick question, what is the difference between PlaybackMixer
and PlaybackMixerElem? I can see that one can be parsed using
snd_use_case_parse _selem_id? Is that the only difference?

Thanks
Curtis
