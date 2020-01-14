Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9813B124
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 18:40:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6511819;
	Tue, 14 Jan 2020 18:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6511819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579023646;
	bh=DceKehGXOIvt2jHh5Kdf3xxx8uRDWO7gLm+79PXEghQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VZ0Tnn+iThp89ZxzMjnn1fd+mO/f11i2Wwj9LLCYesZbnQebGY/y3bj8luxN9Vxyn
	 k2wXHcoK+UpBJSp3kgGavStg8bp5hAyCQqNhTj9mURy719wwPltzBmQVe0eyEBoMgj
	 Obl5tAEZR4aLb0AZKOjzRsi52dtJjYPPTLBnjzm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F01DF800E9;
	Tue, 14 Jan 2020 18:39:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E12F8014E; Tue, 14 Jan 2020 18:38:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E715F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 18:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E715F800E9
Received: from localhost ([130.83.5.183]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis) id
 1MrxfX-1jTRza3v3l-00o1Nx; Tue, 14 Jan 2020 18:38:51 +0100
Date: Tue, 14 Jan 2020 18:38:48 +0100
From: Tim Schumacher <tim@timakro.de>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200114173848.GA28085@impa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d433182-fb2a-d883-a9b3-80110efb89c2@perex.cz>
X-Provags-ID: V03:K1:tYIhtaTngBD9x5FrtnmTsF8PSXOJVmZ69UESrYftf/5DMoYueL8
 dImVrnlou0N9l0T2oQWrxEBP+uItDAO5BU52NwNJ71JHLkT78oDIe8pueryKFEK5lp5QsUM
 rGAbArD8uUCX7qlHZLKNo9Phg3A9fjtk/OJEjCgS1GqVv6exzRgXa2Db2HmQXwBTSZlzaXu
 e4LNX7CWHepe/65ImmJ2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MslzDjTGa3c=:KIHxw1NYD8SI6XHgfkPAyz
 1JYxF3B48C/G6OWNlIljgIPHE8PK74B16/eGkk9v/xA1T+EA+htTdDy4K36ZoIitWTouWFn0i
 TUjHWw9lZYAv7vH8WAgVSODXk4N8Bcf1LlYlcni3swyJ6PMZu8ywxNN0V7Rc0mfuIeMSld8xJ
 C3DH9/zcau4DoE/E55mPynBnelsBRufifKa8ABhRrwP0mouHJHL/iYFhBQzbAGfCw6+U6B8E3
 TRezSrD5SFfcDvKq3pSlX7kAXRzReehqr8QUOSs9fSn4AFXndqRI/eWqbLMgn0dNKfzYVKXFi
 2iVUd+VXYt+pPfUKldUsllwY+Etk+zlMHHv+VZVeMsBkQhjJ7oBgCBjQNCJBm5Ls3pBW4tfWD
 07nICPhNvqiuccUj9az5RIb7b5kwtuYD9+DDazmUX2UowUHirTUSY5LXK45XxNbc4HopsH1/a
 7oUeJY65I0gOqmI+i4H7mB4h44UkEOkkS2AWJo36pFge9oGlR7aR9ysD9QbB4iRPigWMV75aj
 e1S7rdHSodXgn5YpOvVmM7IeGUZNIpcYPDuZyuSKUiV0qXXUVnrGfyW89JYxjb5f+HzNmwF3j
 cJjMuHhDymYSm0VkeEJLyr5V94JKxcoIpaY6ItAXfuInnpt+K8Inv/f4rNVbHLA4jMDi/eNuM
 80no5DuSWLWHG2j7qZpEb9utQF/GXvVE0egDlyJjCcrbC/+6rW21WT4Ah4ET4fvGy+/orCL8j
 QHtf9iacELXdjJ3uF2wXkHVzUDHUX7cTxdwZs3ovSd0Bs52caUbPCdL28upmPycO7lxk+sRXB
 DpA8Rogi+xCxSbSyxg6Fy74NJUDWIJsTd/dAOB25Dity3S/mP0f+jrJ9sOC9rpNEHc9PnturE
 fCeiJUA6MSbYOjdESKoA==
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Bug report for changes in ucm2 with chtrt5645 card
 on Lenovo Miix 320
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

Hi,

sending the mail CC to the mailing list again because I messed this up
last time. This is the output from 'alsaucm -c hw:0 set _verb HiFi'.

ALSA lib utils.c:261:(uc_mgr_config_load) could not open configuration file /usr/share/alsa/ucm2/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216/HiFi-dmic2.conf
ALSA lib parser.c:1190:(parse_verb_file) error: failed to open verb file /usr/share/alsa/ucm2/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216/HiFi-dmic2.conf : -2
ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
alsaucm: error failed to open sound card hw:0: No such file or directory

- Tim

On 2020-01-13, Jaroslav Kysela wrote:
> Dne 13. 01. 20 v 15:27 Tim Schumacher napsal(a):
> > The patch doesn't help unfortunately. Deleting
> > LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf still works with the
> > patch installed. Can I help debug this somehow?
> 
> If you have latest alsa-utils, the command 'alsaucm dump text' should work,
> otherwise try 'alsaucm set _verb HiFi'.
> 
> 					Jaroslav
> 
> > 
> > - Tim
> > 
> > On 2020-01-13, Jaroslav Kysela wrote:
> > > Dne 09. 01. 20 v 23:10 Tim Schumacher napsal(a):
> > > > Hi alsa devs,
> > > > 
> > > > I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
> > > > stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
> > > > IRC helped me track down the problem to a change in the
> > > > /usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
> > > > /usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
> > > > /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > > > were specifically added for this laptop but in the contrary they break the
> > > > sound for me.
> > > > 
> > > > After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:
> > > > 
> > > >       pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
> > > >       pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1
> > > > 
> > > > And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796
> > > > 
> > > > After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > > > symlink both commands from above play sound and this is the alsa-info.sh
> > > > output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076
> > > 
> > > Thanks. I forgot to fix the file path in chtrt5645/chtrt5645-dmic2.conf .
> > > Could you test this patch?
> > > 
> > > https://github.com/alsa-project/alsa-ucm-conf/commit/74f2a0f0884df7b9f2d08d07456a3bc37d1a512e
> > > 
> > > 				Jaroslav
> > > 
> > > -- 
> > > Jaroslav Kysela <perex@perex.cz>
> > > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> > > 
> 
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
