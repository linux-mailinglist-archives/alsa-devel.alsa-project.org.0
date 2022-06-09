Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58A545C6C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3501F12;
	Fri, 10 Jun 2022 08:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3501F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843263;
	bh=1Yj11Ix91VyBN/ArfHYUStZIRtyTBpfzvOrE46dXfR8=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1Gip3qn4WAz7leci3qjy5qhq8zJZLGubPLN35iMfnlMOeSbWUKFwNROiygQDtu/H
	 Fk2APAXOPr2c6oBziOZrWD8E/j/61noJPeMM2kBhh0/s4ds0UW1KKBBqDLGAjAfl+j
	 5w6juMKs/omOxXXDSYNCDQN0VrEXlTIV8XpbIFAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF7AF80549;
	Fri, 10 Jun 2022 08:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBDC4F801F5; Fri, 10 Jun 2022 00:19:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38913F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38913F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="k5UJiPwa"
Received: by mail-pl1-x64a.google.com with SMTP id
 c10-20020a170903234a00b00168b5f7661bso542309plh.6
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VtmBCpNp1KP0Wih0wNtSn6S6eDN4r8qEfTH0S3sfDvI=;
 b=k5UJiPwakkG5FRIZZ5lAwSHv1cl5CV0HckKotKPvFRLB2rm04skCRUAH92Ocj74nI8
 VRgM32h5RM5BUgSugbEFBV15QskHdJF/UARg45aXgMXIqpE44JaqgZSOgpAQZ1jpikDb
 GULMqiClDzX4kfuE9w7o93QGAbqsh6kUT85oC3PEd1vaEzeRnphtmpPAmbhnAhgk6lx0
 LnkSW18ZNlDn2dA0I8HZDUuV5QwUSYnjU7SGR9fWBj1oQGC+opt0AKeg9qvISijvMYMC
 exN/sa9O/SGU7ijyDd9mK0GdtUUcbGfySNVXrOfDrxnggsEQ+nfu/2kYPptx+0sLFFrT
 DcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VtmBCpNp1KP0Wih0wNtSn6S6eDN4r8qEfTH0S3sfDvI=;
 b=nEYr9K6zN2aRkRbJ9/NN5YHIz9Vb2SF5K5OHO0ms1HmnhjjfXshyBHSeQ3ac0mHrd+
 zUJBc16dQw5HriVvBUxgfWCF2CGruG4Zd8FywxkMy3Czxb0TpWAiZIaRLMC8kURlHCau
 hX6Ftg6vunoHWYGWgw70YBk5WMId2ctf7cFv4621rFfBAIQVrTnF1/96IN8MhLevOAgB
 U08CaglwujL+0HIi6bdtZqRz4PjNIS0CvOHa1FgQc7fn/x/ytwtbfLz8eI94jNV1pNSH
 y65e9sG0/+elODqNehA4sMmGU/m5PkLYdMn0edP8e69pANe6Wplhr+D8qHFxwP8aQWGw
 aeJQ==
X-Gm-Message-State: AOAM530yxW+Ue24lV4d4x6NR8gK318Xo6tctfYVUtV+VqGBPHjuwTepG
 o5v0AwWH1Ww+zDmGha7zmQO75nsw
X-Google-Smtp-Source: ABdhPJyLvkWkgsl5N6fEs4uPVrRWt8N7EGGq7Ji9SRjDngCAZu0NMTQ8venaNAjb270E/IyAc5Cnz/CcgQ==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:4722:0:b0:3fb:94a7:9986 with
 SMTP id
 u34-20020a634722000000b003fb94a79986mr36618043pga.531.1654813173379; Thu, 09
 Jun 2022 15:19:33 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:25 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-7-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 06/12] PNP: use correct format characters
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

drivers/pnp/interface.c:273:22: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                pnp_printf(buffer, pnp_resource_type_name(res));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 drivers/pnp/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pnp/interface.c b/drivers/pnp/interface.c
index 44efcdb87e6f..553221a0c89a 100644
--- a/drivers/pnp/interface.c
+++ b/drivers/pnp/interface.c
@@ -270,7 +270,7 @@ static ssize_t resources_show(struct device *dmdev,
 	list_for_each_entry(pnp_res, &dev->resources, list) {
 		res = &pnp_res->res;
 
-		pnp_printf(buffer, pnp_resource_type_name(res));
+		pnp_printf(buffer, "%s", pnp_resource_type_name(res));
 
 		if (res->flags & IORESOURCE_DISABLED) {
 			pnp_printf(buffer, " disabled\n");
-- 
2.36.1.255.ge46751e96f-goog

