Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0229BD31
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 17:45:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FC51682;
	Tue, 27 Oct 2020 17:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FC51682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603817101;
	bh=OQOHVS8bcGZvkTBJmwKxlEuTZIWdxWntvNhv0TMn9AQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DenRfDxpeiMwhdQbWYKA5YNMDxOZHWo8G4/mqbUjbuaKZefVn0Pe4QB8OLWTHRGW2
	 +7NW75zRKLW0arkVvK5zd+yh4z4pRvMntzLKej2anvn4IPp5QdO2BjXZUSPSXf84pb
	 v+4sKf8nQOJ8/VwO1WErAFigC6UygSuzwim4Iivk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9237BF80086;
	Tue, 27 Oct 2020 17:43:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F6FEF8020D; Tue, 27 Oct 2020 17:43:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A3ABF800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A3ABF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FbJgonJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603817000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=mj6uaiHROCag3uZJ/gHJroorYDnXKuN4EyYRFIYPu8Y=;
 b=FbJgonJ171jSzvgL5bSjkunUgVE0c/JRuU5j7wHHrOq44T6Rc1XG2YIppSgfyNdgm3+H4+
 ctgWgWSzC+v9k4HbynT7FMiok41p91k/1D9XSsa58LSES6Nnoq9aGdn6qgLfcJgVN5pG0T
 MbesBu30ocjhHLF8C5sYgz0ikBjQ+6w=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-NLrcfGp1PICkKHs6CRK8zg-1; Tue, 27 Oct 2020 12:43:15 -0400
X-MC-Unique: NLrcfGp1PICkKHs6CRK8zg-1
Received: by mail-oo1-f69.google.com with SMTP id w3so1026653oov.6
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mj6uaiHROCag3uZJ/gHJroorYDnXKuN4EyYRFIYPu8Y=;
 b=aFVxFvc3rmQUUxLnQGrBv+1lqJDWzIfVJx+ymEPELeaRf/8ovmTTudftL0zbXpgGLp
 MoHlVZ6i9Z9FdKDtQzK8Lgn4UZdcHBf2J0p3KXtn3Ey4PDJsK2woAKoHfS14pw2ZPjD9
 6B/oVFcQSPNdyAmgSK8dZg7uWK17TCax7pKlK2B6mZQHIyXE98FOyF4iVketGFJHkv31
 1MN0VDg9nUYddbZWzJEB3abYUwRZszanawImteXjQk6ZK9W7iHuajTUNFwK9iA4CXHgs
 7N2UJ37+x2Av1Z2BaRdK8IQNBbHLCGa6W6/fq53DIUhIhL4qO8dnWOy8fUg0RPMww3Xv
 4scA==
X-Gm-Message-State: AOAM531jzR62Bh4wyn0B4CrIx0PXpKn+bIbpaA1QpXJPjlHOBQqTV2A0
 OWMUPn7lscRY/j3UqkvVTGVs6NXnGutu+sa3RaHml8EGR1+MTFC86ZgqaznoTZP1vp/JAc+AvE5
 MLAYTLlPXQYs/kBErubSXPWM=
X-Received: by 2002:aca:ef03:: with SMTP id n3mr2048484oih.67.1603816994021;
 Tue, 27 Oct 2020 09:43:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7y1eCX7WfRNi9tkZnfLpiDio1qtG9FKTpwYlLMD9SlPYp6FIE57BquNUx5oTk2cs+UUc+WA==
X-Received: by 2002:aca:ef03:: with SMTP id n3mr2048435oih.67.1603816993577;
 Tue, 27 Oct 2020 09:43:13 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l89sm90968otc.6.2020.10.27.09.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:43:12 -0700 (PDT)
From: trix@redhat.com
To: linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Subject: [RFC] clang tooling cleanups
Date: Tue, 27 Oct 2020 09:42:55 -0700
Message-Id: <20201027164255.1573301-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org,
 =?UTF-8?q?=EF=BB=BFFrom=20=3A=20Tom=20Rix?= <trix@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, qat-linux@intel.com,
 amd-gfx@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
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

This rfc will describe
An upcoming treewide cleanup.
How clang tooling was used to programatically do the clean up.
Solicit opinions on how to generally use clang tooling.

The clang warning -Wextra-semi-stmt produces about 10k warnings.
Reviewing these, a subset of semicolon after a switch looks safe to
fix all the time.  An example problem

void foo(int a) {
     switch(a) {
     	       case 1:
	       ...
     }; <--- extra semicolon
}

Treewide, there are about 100 problems in 50 files for x86_64 allyesconfig.
These fixes will be the upcoming cleanup.

clang already supports fixing this problem. Add to your command line

  clang -c -Wextra-semi-stmt -Xclang -fixit foo.c

  foo.c:8:3: warning: empty expression statement has no effect;
    remove unnecessary ';' to silence this warning [-Wextra-semi-stmt]
        };
         ^
  foo.c:8:3: note: FIX-IT applied suggested code changes
  1 warning generated.

The big problem is using this treewide is it will fix all 10k problems.
10k changes to analyze and upstream is not practical.

Another problem is the generic fixer only removes the semicolon.
So empty lines with some tabs need to be manually cleaned.

What is needed is a more precise fixer.

Enter clang-tidy.
https://clang.llvm.org/extra/clang-tidy/

Already part of the static checker infrastructure, invoke on the clang
build with
  make clang-tidy

It is only a matter of coding up a specific checker for the cleanup.
Upstream this is review is happening here
https://reviews.llvm.org/D90180

The development of a checker/fixer is
Start with a reproducer

void foo (int a) {
  switch (a) {};
}

Generate the abstract syntax tree (AST)

  clang -Xclang -ast-dump foo.c

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt 
    |-SwitchStmt 
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt

Write a matcher to get you most of the way

void SwitchSemiCheck::registerMatchers(MatchFinder *Finder) {
  Finder->addMatcher(
      compoundStmt(has(switchStmt().bind("switch"))).bind("comp"), this);
}

The 'bind' method is important, it allows a string to be associated
with a node in the AST.  In this case these are

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt <-------- comp
    |-SwitchStmt <-------- switch
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt

When a match is made the 'check' method will be called.

  void SwitchSemiCheck::check(const MatchFinder::MatchResult &Result) {
    auto *C = Result.Nodes.getNodeAs<CompoundStmt>("comp");
    auto *S = Result.Nodes.getNodeAs<SwitchStmt>("switch");

This is where the string in the bind calls are changed to nodes

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt <-------- comp, C
    |-SwitchStmt <-------- switch, S
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt <---------- looking for N

And then more logic to find the NullStmt

  auto Current = C->body_begin();
  auto Next = Current;
  Next++;
  while (Next != C->body_end()) {
    if (*Current == S) {
      if (const auto *N = dyn_cast<NullStmt>(*Next)) {

When it is found, a warning is printed and a FixItHint is proposed.

  auto H = FixItHint::CreateReplacement(
    SourceRange(S->getBody()->getEndLoc(), N->getSemiLoc()), "}");
  diag(N->getSemiLoc(), "unneeded semicolon") << H;

This fixit replaces from the end of switch to the semicolon with a
'}'.  Because the end of the switch is '}' this has the effect of
removing all the whitespace as well as the semicolon.

Because of the checker's placement in clang-tidy existing linuxkernel
checkers, all that was needed to fix the tree was to add a '-fix'to the
build's clang-tidy call.

I am looking for opinions on what we want to do specifically with
cleanups and generally about other source-to-source programmatic
changes to the code base.

For cleanups, I think we need a new toplevel target

clang-tidy-fix

And an explicit list of fixers that have a very high (100%?) fix rate.

Ideally a bot should make the changes, but a bot could also nag folks.
Is there interest in a bot making the changes? Does one already exist?

The general source-to-source is a bit blue sky.  Ex/ could automagicly
refactor api, outline similar cut-n-pasted functions etc. Anything on
someone's wishlist you want to try out ?

Signed-off-by: Tom Rix <trix@redhat.com>

