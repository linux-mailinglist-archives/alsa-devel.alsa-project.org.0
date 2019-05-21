Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549025AEA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 01:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62781683;
	Wed, 22 May 2019 01:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62781683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558482085;
	bh=AXS6JsIONKgw8+fOrFxk7dE5Xc/q2UX5FsUwJZBNQ68=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KKI+/zEOwoU+dOFDLcpq8zZTL9xLxSrclciw/B2Zc9PM89fyLQ2WMLVjE7Cyn6PCj
	 y1jVv6i/pid6APFY3/HWhiLDMT1+5ihewcNJGjKkr2Xu08/Qe56mmPifs5dgYFyU2B
	 CWlGzCNxNaIaeUuPe+gX0TojtquvgwRcqA50Dw80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDEFF89670;
	Wed, 22 May 2019 01:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E4EF8079B; Wed, 22 May 2019 01:39:37 +0200 (CEST)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B93F8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 01:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B93F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FMz21gFl"
Received: by mail-lf1-x135.google.com with SMTP id h13so226699lfc.7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FvTKu4BuMZPreoTWhrrPJUduR4mDE5OiuyFjGMQ8Ank=;
 b=FMz21gFlFBLuVO8J+KrCOs8Qguo36dHlzl1w3JfdI30M50obQwgUNa7Q6FIrOnNZIf
 +37ed7hmUHaSnofpQ6NyKs7O3Xu3Z8b+6s0dmY10Y0a5XrUc3D3JO9vGRcxkkq2+X8mr
 1BB/n3fLBjuc2NDdsKyWzSrQitTBTzqYLD97bDHQuqCF5QAR+rJuK+c7W6Kl/rSfG0W6
 w9fxaRKHhD6y00YACqatRJSl9UmDaenE4j9+EyByAi8LizGECR41ZuBFCP+t5deT9PY5
 8IAGQz/tPZKiLS1Zf5rEbEzKOxQvL/ipXWEBVn0Gz3cTwfITFQIAbMpvK2B4eXlc8mQ4
 FnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FvTKu4BuMZPreoTWhrrPJUduR4mDE5OiuyFjGMQ8Ank=;
 b=cfcA400wP0V2p4QaURKMJJeGSvPAx6Phxguc7HLMrKd0DQZ/L7LBIKN1yatYlHfIWr
 iBnw1jYdfpwTgVHBInf3OYcB49CEZ2lyg3BYmL/XUBd2DZpqrgcZaaSiufgVYl7lXDDv
 JRfH1UjphwE8Q7ZAa3Ce86g2ESAwsTOBMsjBopkb643wpXiJchGs88qy9ajC5z/rm9F8
 GK74Dgxcb+Tocs4LNytt/Y7LMBgm1rXJr2eW0p5tikJKxHP8nb/eDZvZG/Cvwxfyz2pU
 MwnexO0sMVj5/+qLOE4ANGSuxsZy1qc1l9Scy0H4raZrcu/RzBywESsB37NN5TI6JFiV
 JO+w==
X-Gm-Message-State: APjAAAXs3UfLdKAG8JEoVcBUDTsmIvNj4o1VMyNvuVjaD8HlAqioCWQC
 N7zs8VzDhvbawzq5ZGN9gZ5uen6z8B997/fVX+qPUfuKA+GhNw==
X-Google-Smtp-Source: APXvYqzFnpkqarOIR7tIypptM4i/JnKdL2qDrfK+MKgikzaglkAWAhWT7rPbUPDTD82zQ3mK3f3v21rPoEez0EO/xOU=
X-Received: by 2002:ac2:593a:: with SMTP id v26mr41333233lfi.64.1558481870078; 
 Tue, 21 May 2019 16:37:50 -0700 (PDT)
MIME-Version: 1.0
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 21 May 2019 16:37:39 -0700
Message-ID: <CAOReqxjQAya8GQ4bOSBfTBHwXd38c33pOMc35rrSj4O4jMaMSQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <groeck@google.com>
Subject: [alsa-devel] Cannot build broadwell on for-5.3
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

It appears the for-5.3 branch had some broken commits pulled in at
1c7c3237c0cc4ad3c7b0df458290c8e2a652f178 ("Merge tag 'v5.2-rc1' into
asoc-5.3 ")

building for the pixelbook I get the following build errors:

Invalid absolute R_X86_64_32S relocation: _etext
make[3]: *** [/mnt/host/source/src/third_party/kernel/v4.14/arch/x86/boot/compressed/Makefile:130:
arch/x86/boot/compressed/vmlinux.relocs] Error 1
make[3]: *** Deleting file 'arch/x86/boot/compressed/vmlinux.relocs'

Mainline is still broken as well. Not sure how to propagate this up to
the responsible parties, figured I would start a discussion here
first. I am also open to suggestions if there is a chance I am missing
something.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
