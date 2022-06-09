Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6A545C70
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5B12070;
	Fri, 10 Jun 2022 08:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5B12070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843321;
	bh=+g/rZ3qeDrK4A48IdvTYtN45u6GFX7MLAEaD6jQLlvc=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeAnMGwZXzPABlZJSVBar9YW6BjYVbEV6iiih7XdwxDCt3TDlDf5FIvuTHgXBRfNR
	 sqLTUAwPUB7A9OIZuaTgErOeEx/i4qh+xi4ZNTgqWM/McVY/dccRx+tgemCWG9uct0
	 uwgRSkqm6KazMjJun/McTXlLavd7kMDi67XwlaBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7A7F80578;
	Fri, 10 Jun 2022 08:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7FF5F801F5; Fri, 10 Jun 2022 00:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF115F800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF115F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rIM31hja"
Received: by mail-yb1-xb49.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so21424250ybp.19
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v4Xn62a8gwv09PX197f2KX5K6c68JUg+Unaoh5Rs3zU=;
 b=rIM31hja6TacLFy83ekGaYY6NocbE3+qp06k1AYSWqT3YCOM3vKnexoLoVRg3/QFrC
 NK6lDPMraatUaGV4ysDVq7Ma73A8ej30mShvcnMynXPj4q1s4HwLXHsyE5NReacxVqEF
 SN/r5DNjRMP1h9Yx1PS5+t5PqoRBJ1DmF1KeRqex3FpyMoNRbYlXt2tQwLA6Cftv+3aS
 xU6s22QmO1Pl1Kwrbe6vsMz+d3Z4FRfHNfEK9twj222QTX3BVZNBOKgun1MV8xBDAQQA
 +IscNJZzBGaDfdE3Gg++zvAyvxAsnUQ0EJis1knVDwKv7m2aWEOPArINp5NiPyNi+Z2n
 h4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v4Xn62a8gwv09PX197f2KX5K6c68JUg+Unaoh5Rs3zU=;
 b=pEmJQp+xQZIAWOnmvaR4hFE2RTKJQ7jJU7H884SyxKgHOIuGqWFx+7DY78ZvvzO0oX
 Y+ng20ho8dr60+MS7Sop6v9H0rMhA4ZTpKvkYXW59r+8E+hBO4bHu0cJgP47Kx/BUSGJ
 KzvgZEo0jLG+brOXGFnUxe2LD4Sy0Qvif4EIk+gMsvCkppFTqpEjXeuOv4HMFYJ1mL5i
 cftiAtBu4eze4ierJoXxFfpbAUMVdWHvQNpjeGFEX3zMPoNlOYFKTBTD5mRWpcQLOPc4
 GDSXFILo/Jhg5CCnqS8I40TWxyIq+3dAMMF/6443Auu12xCcwJCcquXr/KNMfiUgc9ZW
 UMwg==
X-Gm-Message-State: AOAM530zEijO/LFWC3kgWMRlNWQrvsV2npXOkjs7sniPbUvD+2GbKkBn
 AcKgizGZ8sm4wsZ3sF+vzHj0I6hq
X-Google-Smtp-Source: ABdhPJwSDxouzP8D6734EA8fpYrXSwixl1FJKKaGzKk8Ee6TEpQt79esVExDoO3PJGM+WWqOyJq6+ArWEg==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a25:76d5:0:b0:663:ad77:8d48 with
 SMTP id
 r204-20020a2576d5000000b00663ad778d48mr18678005ybc.633.1654813262959; Thu, 09
 Jun 2022 15:21:02 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:29 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-11-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 10/12] ALSA: seq: use correct format characters
From: Bill Wendling <morbo@google.com>
To: isanbard@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:37 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, llvm@lists.linux.dev,
 coreteam@netfilter.org, Arnd Bergmann <arnd@arndb.de>,
 Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

From: Bill Wendling <isanbard@gmail.com>

When compiling with -Wformat, clang emits the following warnings:

sound/core/sound.c:79:17: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        request_module(str);
                       ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/sound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index df5571d98629..7866f29621bf 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -76,7 +76,7 @@ static void snd_request_other(int minor)
 	case SNDRV_MINOR_TIMER:		str = "snd-timer";	break;
 	default:			return;
 	}
-	request_module(str);
+	request_module("%s", str);
 }
 
 #endif	/* modular kernel */
-- 
2.36.1.255.ge46751e96f-goog

