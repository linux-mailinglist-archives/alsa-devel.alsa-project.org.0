Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1C2E7F8C
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:03:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CFFB16FD;
	Thu, 31 Dec 2020 12:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CFFB16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609412605;
	bh=AhLRj3jMmPOVmCz3riSwaBD5KAApsGqJnYzB6c3plpg=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=ZROAqeXouMbRCT1ANr+ekLz4vF8HtJylL5tg3+6dRQnUP7n1PjByHkJfTfHdmwEEB
	 BBV5oRKW6bbQiGglc5opSnpVKpeWYCxfLycQ0RHliSAG77YtnmgNeCreDuASLSs8PR
	 g36w7G1jJXb58GyODiRIfOjxofClbllXCWF7yKUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CF3F8027C;
	Thu, 31 Dec 2020 12:01:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DD63F801F5; Mon, 28 Dec 2020 15:46:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B402F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 15:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B402F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="bWCdv4hl"
Date: Mon, 28 Dec 2020 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1609166774;
 bh=RHGVTBBSe3J8pgiH7UN2WJKVqia+Zw9bkLblI03PsLo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bWCdv4hllX2Ge7kCnBy9mPoD/DZ9HnMwn3+Xzp+g80hyp77dsxG+R6QuTOkghBidp
 lEPedcHG5cjlxUTRluchu4kVkwvZ11HlBbmia4DeDC6WUfevdJVtGYzLTJm6XtpzXw
 Evbm37E+/FR0VuS2apKkbzrPoEVTU5AHweg7LMyE=
To: Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
From: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@protonmail.com>
Subject: [PATCH v2] docs: Fix reST markup when linking to sections
Message-ID: <20201228144537.135353-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:01:40 +0100
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 rcu@vger.kernel.org, lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
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
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

During the process of converting the documentation to reST, some links
were converted using the following wrong syntax (and sometimes using %20
instead of spaces):

   `Display text <#section-name-in-html>`__

This syntax isn't valid according to the docutils' spec [1], but more
importantly, it is specific to HTML, since it uses '#' to link to an
HTML anchor.

The right syntax would instead use a docutils hyperlink reference as the
embedded URI to point to the section [2], that is:

   `Display text <Section Name_>`__

This syntax works in both HTML and PDF.

The LaTeX toolchain doesn't mind the HTML anchor syntax when generating
the pdf documentation (make pdfdocs), that is, the build succeeds but
the links don't work, but that syntax causes errors when trying to build
using the not-yet-merged rst2pdf:

   ValueError: format not resolved, probably missing URL scheme or undefine=
d destination target for 'Forcing%20Quiescent%20States'

So, use the correct syntax in order to have it work in all different
output formats.

[1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#ref=
erence-names
[2]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#emb=
edded-uris-and-aliases

Fixes: ccc9971e2147 ("docs: rcu: convert some articles from html to ReST")
Fixes: c8cce10a62aa ("docs: Fix the reference labels in Locking.rst")
Fixes: e548cdeffcd8 ("docs-rst: convert kernel-locking to ReST")
Fixes: 7ddedebb03b7 ("ALSA: doc: ReSTize writing-an-alsa-driver document")
Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---

Changes in v2:
- Thanks to Mauro:
  - Simplify the syntax of some links by taking advantage of docutils'
    case-insensitivity when dealing with references.

 .../Tree-RCU-Memory-Ordering.rst              |  8 ++++----
 .../RCU/Design/Requirements/Requirements.rst  | 20 +++++++++----------
 Documentation/kernel-hacking/locking.rst      |  8 ++++----
 .../kernel-api/writing-an-alsa-driver.rst     | 16 +++++++--------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Order=
ing.rst b/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering=
.rst
index e44cfcb7adcc..e57927427786 100644
--- a/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst
+++ b/Documentation/RCU/Design/Memory-Ordering/Tree-RCU-Memory-Ordering.rst
@@ -473,7 +473,7 @@ read-side critical sections that follow the idle period=
 (the oval near
 the bottom of the diagram above).
=20
 Plumbing this into the full grace-period execution is described
-`below <#Forcing%20Quiescent%20States>`__.
+`below <Forcing Quiescent States_>`__.
=20
 CPU-Hotplug Interface
 ^^^^^^^^^^^^^^^^^^^^^
@@ -494,7 +494,7 @@ mask to detect CPUs having gone offline since the begin=
ning of this
 grace period.
=20
 Plumbing this into the full grace-period execution is described
-`below <#Forcing%20Quiescent%20States>`__.
+`below <Forcing Quiescent States_>`__.
=20
 Forcing Quiescent States
 ^^^^^^^^^^^^^^^^^^^^^^^^
@@ -532,7 +532,7 @@ from other CPUs.
 | RCU. But this diagram is complex enough as it is, so simplicity       |
 | overrode accuracy. You can think of it as poetic license, or you can  |
 | think of it as misdirection that is resolved in the                   |
-| `stitched-together diagram <#Putting%20It%20All%20Together>`__.       |
+| `stitched-together diagram <Putting It All Together_>`__.             |
 +-----------------------------------------------------------------------+
=20
 Grace-Period Cleanup
@@ -596,7 +596,7 @@ maintain ordering. For example, if the callback functio=
n wakes up a task
 that runs on some other CPU, proper ordering must in place in both the
 callback function and the task being awakened. To see why this is
 important, consider the top half of the `grace-period
-cleanup <#Grace-Period%20Cleanup>`__ diagram. The callback might be
+cleanup`_ diagram. The callback might be
 running on a CPU corresponding to the leftmost leaf ``rcu_node``
 structure, and awaken a task that is to run on a CPU corresponding to
 the rightmost leaf ``rcu_node`` structure, and the grace-period kernel
diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Docum=
entation/RCU/Design/Requirements/Requirements.rst
index 1ae79a10a8de..ce1075f040be 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -45,7 +45,7 @@ requirements:
 #. `Other RCU Flavors`_
 #. `Possible Future Changes`_
=20
-This is followed by a `summary <#Summary>`__, however, the answers to
+This is followed by a summary_, however, the answers to
 each quick quiz immediately follows the quiz. Select the big white space
 with your mouse to see the answer.
=20
@@ -1096,7 +1096,7 @@ memory barriers.
 | case, voluntary context switch) within an RCU read-side critical      |
 | section. However, sleeping locks may be used within userspace RCU     |
 | read-side critical sections, and also within Linux-kernel sleepable   |
-| RCU `(SRCU) <#Sleepable%20RCU>`__ read-side critical sections. In     |
+| RCU `(SRCU) <Sleepable RCU_>`__ read-side critical sections. In       |
 | addition, the -rt patchset turns spinlocks into a sleeping locks so   |
 | that the corresponding critical sections can be preempted, which also |
 | means that these sleeplockified spinlocks (but not other sleeping     |
@@ -1186,7 +1186,7 @@ non-preemptible (``CONFIG_PREEMPT=3Dn``) kernels, and=
 thus `tiny
 RCU <https://lkml.kernel.org/g/20090113221724.GA15307@linux.vnet.ibm.com>`=
__
 was born. Josh Triplett has since taken over the small-memory banner
 with his `Linux kernel tinification <https://tiny.wiki.kernel.org/>`__
-project, which resulted in `SRCU <#Sleepable%20RCU>`__ becoming optional
+project, which resulted in `SRCU <Sleepable RCU_>`__ becoming optional
 for those kernels not needing it.
=20
 The remaining performance requirements are, for the most part,
@@ -1457,8 +1457,8 @@ will vary as the value of ``HZ`` varies, and can also=
 be changed using
 the relevant Kconfig options and kernel boot parameters. RCU currently
 does not do much sanity checking of these parameters, so please use
 caution when changing them. Note that these forward-progress measures
-are provided only for RCU, not for `SRCU <#Sleepable%20RCU>`__ or `Tasks
-RCU <#Tasks%20RCU>`__.
+are provided only for RCU, not for `SRCU <Sleepable RCU_>`__ or `Tasks
+RCU`_.
=20
 RCU takes the following steps in ``call_rcu()`` to encourage timely
 invocation of callbacks when any given non-\ ``rcu_nocbs`` CPU has
@@ -1477,8 +1477,8 @@ encouragement was provided:
=20
 Again, these are default values when running at ``HZ=3D1000``, and can be
 overridden. Again, these forward-progress measures are provided only for
-RCU, not for `SRCU <#Sleepable%20RCU>`__ or `Tasks
-RCU <#Tasks%20RCU>`__. Even for RCU, callback-invocation forward
+RCU, not for `SRCU <Sleepable RCU_>`__ or `Tasks
+RCU`_. Even for RCU, callback-invocation forward
 progress for ``rcu_nocbs`` CPUs is much less well-developed, in part
 because workloads benefiting from ``rcu_nocbs`` CPUs tend to invoke
 ``call_rcu()`` relatively infrequently. If workloads emerge that need
@@ -1920,7 +1920,7 @@ Hotplug CPU
=20
 The Linux kernel supports CPU hotplug, which means that CPUs can come
 and go. It is of course illegal to use any RCU API member from an
-offline CPU, with the exception of `SRCU <#Sleepable%20RCU>`__ read-side
+offline CPU, with the exception of `SRCU <Sleepable RCU_>`__ read-side
 critical sections. This requirement was present from day one in
 DYNIX/ptx, but on the other hand, the Linux kernel's CPU-hotplug
 implementation is =E2=80=9Cinteresting.=E2=80=9D
@@ -2147,7 +2147,7 @@ handles these states differently:
 However, RCU must be reliably informed as to whether any given CPU is
 currently in the idle loop, and, for ``NO_HZ_FULL``, also whether that
 CPU is executing in usermode, as discussed
-`earlier <#Energy%20Efficiency>`__. It also requires that the
+`earlier <Energy Efficiency_>`__. It also requires that the
 scheduling-clock interrupt be enabled when RCU needs it to be:
=20
 #. If a CPU is either idle or executing in usermode, and RCU believes it
@@ -2264,7 +2264,7 @@ Performance, Scalability, Response Time, and Reliabil=
ity
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Expanding on the `earlier
-discussion <#Performance%20and%20Scalability>`__, RCU is used heavily by
+discussion <Performance and Scalability_>`__, RCU is used heavily by
 hot code paths in performance-critical portions of the Linux kernel's
 networking, security, virtualization, and scheduling code paths. RCU
 must therefore use efficient implementations, especially in its
diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kerne=
l-hacking/locking.rst
index 6ed806e6061b..c3448929a824 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -118,11 +118,11 @@ spinlock, but you may block holding a mutex. If you c=
an't lock a mutex,
 your task will suspend itself, and be woken up when the mutex is
 released. This means the CPU can do something else while you are
 waiting. There are many cases when you simply can't sleep (see
-`What Functions Are Safe To Call From Interrupts? <#sleeping-things>`__),
+`What Functions Are Safe To Call From Interrupts?`_),
 and so have to use a spinlock instead.
=20
 Neither type of lock is recursive: see
-`Deadlock: Simple and Advanced <#deadlock>`__.
+`Deadlock: Simple and Advanced`_.
=20
 Locks and Uniprocessor Kernels
 ------------------------------
@@ -179,7 +179,7 @@ perfect world).
=20
 Note that you can also use spin_lock_irq() or
 spin_lock_irqsave() here, which stop hardware interrupts
-as well: see `Hard IRQ Context <#hard-irq-context>`__.
+as well: see `Hard IRQ Context`_.
=20
 This works perfectly for UP as well: the spin lock vanishes, and this
 macro simply becomes local_bh_disable()
@@ -230,7 +230,7 @@ The Same Softirq
 ~~~~~~~~~~~~~~~~
=20
 The same softirq can run on the other CPUs: you can use a per-CPU array
-(see `Per-CPU Data <#per-cpu-data>`__) for better performance. If you're
+(see `Per-CPU Data`_) for better performance. If you're
 going so far as to use a softirq, you probably care about scalable
 performance enough to justify the extra complexity.
=20
diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Do=
cumentation/sound/kernel-api/writing-an-alsa-driver.rst
index 73bbd59afc33..e6365836fa8b 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -71,7 +71,7 @@ core/oss
 The codes for PCM and mixer OSS emulation modules are stored in this
 directory. The rawmidi OSS emulation is included in the ALSA rawmidi
 code since it's quite small. The sequencer code is stored in
-``core/seq/oss`` directory (see `below <#core-seq-oss>`__).
+``core/seq/oss`` directory (see `below <core/seq/oss_>`__).
=20
 core/seq
 ~~~~~~~~
@@ -382,7 +382,7 @@ where ``enable[dev]`` is the module option.
 Each time the ``probe`` callback is called, check the availability of
 the device. If not available, simply increment the device index and
 returns. dev will be incremented also later (`step 7
-<#set-the-pci-driver-data-and-return-zero>`__).
+<7) Set the PCI driver data and return zero._>`__).
=20
 2) Create a card instance
 ~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -450,10 +450,10 @@ field contains the information shown in ``/proc/asoun=
d/cards``.
 5) Create other components, such as mixer, MIDI, etc.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-Here you define the basic components such as `PCM <#PCM-Interface>`__,
-mixer (e.g. `AC97 <#API-for-AC97-Codec>`__), MIDI (e.g.
-`MPU-401 <#MIDI-MPU401-UART-Interface>`__), and other interfaces.
-Also, if you want a `proc file <#Proc-Interface>`__, define it here,
+Here you define the basic components such as `PCM <PCM Interface_>`__,
+mixer (e.g. `AC97 <API for AC97 Codec_>`__), MIDI (e.g.
+`MPU-401 <MIDI (MPU401-UART) Interface_>`__), and other interfaces.
+Also, if you want a `proc file <Proc Interface_>`__, define it here,
 too.
=20
 6) Register the card instance.
@@ -941,7 +941,7 @@ The allocation of an interrupt source is done like this=
:
   chip->irq =3D pci->irq;
=20
 where :c:func:`snd_mychip_interrupt()` is the interrupt handler
-defined `later <#pcm-interface-interrupt-handler>`__. Note that
+defined `later <PCM Interrupt Handler_>`__. Note that
 ``chip->irq`` should be defined only when :c:func:`request_irq()`
 succeeded.
=20
@@ -3104,7 +3104,7 @@ processing the output stream in the irq handler.
=20
 If the MPU-401 interface shares its interrupt with the other logical
 devices on the card, set ``MPU401_INFO_IRQ_HOOK`` (see
-`below <#MIDI-Interrupt-Handler>`__).
+`below <MIDI Interrupt Handler_>`__).
=20
 Usually, the port address corresponds to the command port and port + 1
 corresponds to the data port. If not, you may change the ``cport``
--=20
2.29.2


