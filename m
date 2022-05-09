Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B031852084F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 01:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FE218A1;
	Tue, 10 May 2022 01:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FE218A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652138431;
	bh=/dGBBwwvPf6pz/45C4pT69BvJQJBvakcgxo3mEZU/MM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNIWkJDHGQJXBAaoDs0Z6Zv2PwJVIT1YmYbxwxhmxoanTmGmGAFVMx6TDCge+GSoK
	 yaQJvRIEGd2z5+8KzUt2F1DROfmecMSchouJTEvooJgRDEK/JDpJH0uonbng3y0JEq
	 rPyrnoddJrv83fXNCjURrJDGpuWgq2/ha7f8+/sI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89113F804A9;
	Tue, 10 May 2022 01:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD16F80269; Tue, 10 May 2022 01:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7C8C5F80269
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 01:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8C5F80269
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652138357241818905-webhooks-bot@alsa-project.org>
References: <1652138357241818905-webhooks-bot@alsa-project.org>
Subject: Parallel build failure in rate/ (probably rate-lav/, pph/ too)
Message-Id: <20220509231923.3AD16F80269@alsa1.perex.cz>
Date: Tue, 10 May 2022 01:19:23 +0200 (CEST)
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

alsa-project/alsa-plugins issue #44 was edited from thesamesam:

Originally reported downstream in [Gentoo](https://bugs.gentoo.org/835920) by a user.

It looks like in `rate/Makefile.am` (and I think ditto for `rate-lav/Makefile.am`, `pph/Makefile.am`), with high parallelism (`make -jN install`, for large N), `$(DESTDIR)@ALSA_PLUGIN_DIR@` may not have been created yet. All of these dirs override `install-exec-hook`.

For other subdirs, like `jack/Makefile.am`, there's no problem, because the implementation of `install-exec-hook` for those is set by `install-hooks.am` which handles `mkdir -p` before symlinking/installing.

Example of failure:
```
>>> Install media-plugins/alsa-plugins-1.2.2 into /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image
 * abi_x86_64.amd64: running multilib-minimal_abi_src_install
make -j2 DESTDIR=/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image install 
Making install in doc
make[1]: Entering directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/doc'
make[2]: Entering directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/doc'
make[2]: Nothing to be done for 'install-exec-am'.
make[2]: Nothing to be done for 'install-data-am'.
make[2]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/doc'
make[1]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/doc'
Making install in rate
make[1]: Entering directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
make[2]: Entering directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
make  install-exec-hook
 /bin/mkdir -p '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/share/alsa/alsa.conf.d'
make[3]: Entering directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
rm -f /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib/libasound_module_rate_samplerate_*.so
ln -s libasound_module_rate_samplerate.so /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib/libasound_module_rate_samplerate_best.so
 /usr/bin/install -c -m 644 /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2/rate/10-samplerate.conf '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/share/alsa/alsa.conf.d'
ln: failed to create symbolic link '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib/libasound_module_rate_samplerate_best.so': No such file or directory
make[3]: *** [Makefile:738: install-exec-hook] Error 1
make[3]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
make[2]: *** [Makefile:651: install-exec-am] Error 2
make[2]: *** Waiting for unfinished jobs....
 /bin/mkdir -p '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib'
 /bin/sh ../libtool   --mode=install /usr/bin/install -c   libasound_module_rate_samplerate.la '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib'
libtool: install: /usr/bin/install -c .libs/libasound_module_rate_samplerate.so /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib/libasound_module_rate_samplerate.so
libtool: install: /usr/bin/install -c .libs/libasound_module_rate_samplerate.lai /var/tmp/portage/media-plugins/alsa-plugins-1.2.2/image/usr/lib64/alsa-lib/libasound_module_rate_samplerate.la
libtool: warning: remember to run 'libtool --finish /usr/lib64/alsa-lib'
make[2]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
make[1]: *** [Makefile:594: install-am] Error 2
make[1]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.2/work/alsa-plugins-1.2.2-abi_x86_64.amd64/rate'
make: *** [Makefile:444: install-recursive] Error 1
 * ERROR: media-plugins/alsa-plugins-1.2.2::gentoo failed (install phase):
 *   emake failed
```

Reported to happen with 1.2.6 too, which makes sense, as nothing changed there.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/44
Repository URL: https://github.com/alsa-project/alsa-plugins
